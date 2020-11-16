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
 * @file  TLCsvExporter.cpp
 *
 * @brief Dynawo timeline csv exporter : implementation file
 *
 */
#include "TLCsvExporter.h"

#include "DYNMacrosMessage.h"
#include "TLEvent.h"
#include "TLTimeline.h"

#include <fstream>
#include <sstream>

using std::fstream;
using std::ostream;

namespace timeline {

void
CsvExporter::exportToFile(const boost::shared_ptr<Timeline>& timeline, const std::string& filePath) const {
  fstream file;
  file.open(filePath.c_str(), fstream::out);
  if (!file.is_open()) {
    throw DYNError(DYN::Error::API, FileGenerationFailed, filePath.c_str());
  }
  exportToStream(timeline, file);
  file.close();
}

void
CsvExporter::exportToStream(const boost::shared_ptr<Timeline>& timeline, ostream& stream) const {
  const std::string CSVEXPORTER_SEPARATOR = ";";  ///< definition of the separator to use in csv files

  for (Timeline::event_const_iterator itEvent = timeline->cbeginEvent(); itEvent != timeline->cendEvent(); ++itEvent) {
    stream << (*itEvent)->getTime() << CSVEXPORTER_SEPARATOR << (*itEvent)->getModelName() << CSVEXPORTER_SEPARATOR << (*itEvent)->getMessage();
    if ((*itEvent)->hasPriority()) {
      stream << CSVEXPORTER_SEPARATOR << (*itEvent)->getPriority();
    }
    stream << "\n";
  }
}

}  // namespace timeline
