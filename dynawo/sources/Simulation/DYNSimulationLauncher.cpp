//
// Copyright (c) 2015-2019, RTE (http://www.rte-france.com)
// See AUTHORS.txt
// All rights reserved.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at http://mozilla.org/MPL/2.0/.
// SPDX-License-Identifier: MPL-2.0
//
// This file is part of Dynawo, an hybrid C++/Modelica open source time domain
// simulation tool for power systems.
//

/**
 * @file  DYNSimulationLauncher.cpp
 *
 * @brief SimulationLauncher implementation
 *
 */

#include <string>

#include "DYNSimulationLauncher.h"
#include "DYNMacrosMessage.h"
#include "DYNTrace.h"
#include "DYNSimulation.h"
#include "DYNSimulationContext.h"
#include "DYNFileSystemUtils.h"
#include "DYNTimer.h"
#include "DYNExecUtils.h"
#include "JOBXmlImporter.h"
#include "JOBIterators.h"
#include "JOBJobsCollection.h"
#include "JOBOutputsEntry.h"

using DYN::Trace;
using DYN::Simulation;
using DYN::SimulationContext;

void launchSimu(const std::string& jobsFileName) {
#if defined(_DEBUG_) || defined(PRINT_TIMERS)
  DYN::Timer timer("Main::LaunchSimu");
#endif

  job::XmlImporter importer;
  boost::shared_ptr<job::JobsCollection> jobsCollection = importer.importFromFile(jobsFileName);
  std::string prefixJobFile = absolute(remove_file_name(jobsFileName));
  if (jobsCollection->begin() == jobsCollection->end())
    throw DYNError(DYN::Error::SIMULATION, NoJobDefined);
  Trace::init();

  for (job::job_iterator itJobEntry = jobsCollection->begin();
      itJobEntry != jobsCollection->end();
      ++itJobEntry) {
    ::TraceInfo() << DYNLog(LaunchingJob, (*itJobEntry)->getName()) << Trace::endline;

    boost::shared_ptr<SimulationContext> context = boost::shared_ptr<SimulationContext>(new SimulationContext());
    context->setResourcesDirectory(getMandatoryEnvVar("DYNAWO_RESOURCES_DIR"));
    context->setLocale(getMandatoryEnvVar("DYNAWO_LOCALE"));
    context->setInputDirectory(prefixJobFile);
    context->setWorkingDirectory(prefixJobFile);

    boost::shared_ptr<Simulation> simulation;
    try {
      simulation = boost::shared_ptr<Simulation>(new Simulation((*itJobEntry), context));
      simulation->init();
    } catch (const DYN::Error& err) {
      TraceError() << err.what() << Trace::endline;
      throw;
    } catch (const DYN::MessageError& e) {
      TraceError() << e.what() << Trace::endline;
      throw;
    } catch (const char *s) {
      TraceError() << s << Trace::endline;
      throw;
    } catch (const std::string & Msg) {
      TraceError() << Msg << Trace::endline;
      throw;
    } catch (std::exception & exc) {
      TraceError() << exc.what() << Trace::endline;
      throw;
    }

    try {
      simulation->simulate();
      simulation->terminate();
    } catch (const DYN::Error& err) {
      // Needed as otherwise terminate might crash due to missing staticRef variables
      if (err.key() == DYN::KeyError_t::StateVariableNoReference)
        simulation->activateExportIIDM(false);
      TraceError() << err.what() << Trace::endline;
      simulation->terminate();
      throw;
    } catch (const DYN::Terminate& e) {
      TraceError() << e.what() << Trace::endline;
      simulation->terminate();
      throw;
    } catch (const DYN::MessageError& e) {
      TraceError() << e.what() << Trace::endline;
      simulation->terminate();
      throw;
    } catch (const char *s) {
      TraceError() << s << Trace::endline;
      simulation->terminate();
      throw;
    } catch (const std::string & Msg) {
      TraceError() << Msg << Trace::endline;
      simulation->terminate();
      throw;
    } catch (std::exception & exc) {
      TraceError() << exc.what() << Trace::endline;
      simulation->terminate();
      throw;
    }
    simulation->clean();
    TraceInfo() << DYNLog(EndOfJob, (*itJobEntry)->getName()) << Trace::endline;
    Trace::resetCustomAppenders();
    Trace::init();
    TraceInfo() << DYNLog(JobSuccess, (*itJobEntry)->getName()) << Trace::endline;
    if ((*itJobEntry)->getOutputsEntry()) {
      std::string outputsDirectory = createAbsolutePath((*itJobEntry)->getOutputsEntry()->getOutputsDirectory(), context->getWorkingDirectory());
      TraceInfo() << DYNLog(ResultFolder, outputsDirectory) << Trace::endline;
    }
  }
}
