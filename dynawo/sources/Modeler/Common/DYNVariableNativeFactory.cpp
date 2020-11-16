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
 * @file  DYNVariableNativeFactory.cpp
 *
 * @brief Dynawo native variable : factory file
 */
#include "DYNVariableNativeFactory.h"

#include "DYNVariableNative.h"

using boost::shared_ptr;
using std::string;

namespace DYN {

shared_ptr<VariableNative>
VariableNativeFactory::create(const string& name, const typeVar_t& type, bool isState, bool negated) {
  return shared_ptr<VariableNative>(new VariableNative(name, type, isState, negated));
}

}  // namespace DYN
