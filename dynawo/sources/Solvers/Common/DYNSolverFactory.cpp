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
 * @file DYNSolverFactory.cpp
 * @brief Solver factory implementation
 *
 */

#include <sstream>
#include <iostream>

#include "DYNTrace.h"
#include "DYNSolverFactory.h"
#include "DYNMacrosMessage.h"

using std::map;
using std::string;
using std::stringstream;

namespace DYN {
/**
 * @brief type of the function return by dlsym
 */
typedef SolverFactory* getFactory_t();

SolverFactories SolverFactory::factories_;

SolverFactories::SolverFactories() { }

SolverFactories::~SolverFactories() {
  SolverFactoryIterator iter = factoryMap_.begin();
  for (; iter != factoryMap_.end(); ++iter) {
    boost::function<destroy_solver_t>& deleteFactory = factoryMapDestroy_.find(iter->first)->second;

    deleteFactory(iter->second);
  }
}

SolverFactories::SolverFactoryIterator SolverFactories::find(const std::string& lib) {
  return (factoryMap_.find(lib));
}

bool SolverFactories::end(SolverFactoryIterator& iter) {
  return (iter == factoryMap_.end());
}

void
SolverFactories::add(const std::string& lib, SolverFactory* factory) {
  factoryMap_.insert(std::make_pair(lib, factory));
}

void SolverFactories::add(const std::string& lib, const boost::function<destroy_solver_t>& deleteFactory) {
  factoryMapDestroy_.insert(std::make_pair(lib, deleteFactory));
}

boost::shared_ptr<Solver> SolverFactory::createSolverFromLib(const std::string& lib) {
  SolverFactories::SolverFactoryIterator iter = factories_.find(lib);
  Solver* solver;
  boost::shared_ptr<Solver> solverShared;
  boost::shared_ptr<boost::dll::shared_library> sharedib;

  if (factories_.end(iter)) {
    std::string func;
    boost::function<getFactory_t> getFactory;
    boost::function<destroy_solver_t> deleteFactory;
    try {
      sharedib = boost::make_shared<boost::dll::shared_library>(lib);
      func = "getFactory";
      getFactory = boost::dll::import<getFactory_t>(*sharedib, func.c_str());
      func = "deleteFactory";
      deleteFactory = boost::dll::import<destroy_solver_t>(*sharedib, func.c_str());
    } catch (const boost::system::system_error& e) {
      Trace::error() << "Load error :" << e.what() << Trace::endline;
      if (func.empty()) {
        throw DYNError(DYN::Error::GENERAL, LibraryLoadFailure, lib);
      } else {
        throw DYNError(DYN::Error::GENERAL, LibraryLoadFailure, lib + "::" + func);
      }
    }

    SolverFactory* factory = getFactory();
    factory->lib_ = sharedib;
    factories_.add(lib, factory);
    factories_.add(lib, deleteFactory);
    solver = factory->create();
    SolverDelete deleteSolver(factory);
    solverShared.reset(solver, deleteSolver);
  } else {
    solver = iter->second->create();
    SolverDelete deleteSolver(iter->second);
    solverShared.reset(solver, deleteSolver);
  }
  return solverShared;
}

SolverDelete::SolverDelete(SolverFactory* factory) : factory_(factory) {
}

void SolverDelete::operator()(Solver* solver) {
  factory_->destroy(solver);
}

}  // end of namespace DYN
