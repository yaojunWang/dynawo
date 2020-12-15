//
// Copyright (c) 2020, RTE (http://www.rte-france.com)
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
 * @file  DYNServiceManagerInterface.h
 *
 * @brief Service manager interface file
 *
 */
#ifndef MODELER_DATAINTERFACE_DYNSERVICEMANAGERINTERFACE_H_
#define MODELER_DATAINTERFACE_DYNSERVICEMANAGERINTERFACE_H_

#include <string>
#include <vector>

namespace DYN {

/**
 * @brief Interface for dynawo service interface
 */
struct ServiceManagerInterface {
  /**
   * @brief Destructor
   */
  virtual ~ServiceManagerInterface() {}

  /**
   * @brief Retrieve the buses linked to a bus by a switches network path
   *
   * precondition: bus of id @p busId is contained in voltage level @p VLId . @p VLId argument is here to improve performance
   * and avoid searching for the container of the bus.
   *
   * The voltage level interface must have a bus breaker topology
   *
   * @param busId bus id to check
   * @param VLId the id of the voltage level containing @p busId
   * @returns the list of the bus ids linked to @p busId
   */
  virtual std::vector<std::string> getBusesConnectedBySwitch(const std::string& busId, const std::string& VLId) const = 0;
};
}  // namespace DYN

#endif  // MODELER_DATAINTERFACE_DYNSERVICEMANAGERINTERFACE_H_
