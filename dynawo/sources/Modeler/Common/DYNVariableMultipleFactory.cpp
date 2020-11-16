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
 * @file  DYNVariableMultipleFactory.cpp
 *
 * @brief Dynawo Multiple variable : factory file
 */
#include "DYNVariableMultipleFactory.h"

#include "DYNVariableMultiple.h"

using boost::shared_ptr;
using std::string;

namespace DYN {

shared_ptr<VariableMultiple>
VariableMultipleFactory::create(const string& name, const string& cardinalityName, const typeVar_t& type, bool isState, bool negated) {
  return shared_ptr<VariableMultiple>(new VariableMultiple(name, cardinalityName, type, isState, negated));
}

}  // namespace DYN
