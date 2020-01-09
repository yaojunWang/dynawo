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
 * @file  DYNModelCurrentLimits.cpp
 *
 * @brief
 *
 */
#include <limits>
#include <iostream>
#include "DYNModelCurrentLimits.h"
#include "DYNModelNetwork.h"
#include "DYNMacrosMessage.h"
#include "DYNModelConstants.h"

using std::string;

namespace DYN {

ModelCurrentLimits::ModelCurrentLimits() {
  nbLimits_ = 0;
  nbTemporaryLimits_ = 0;
  side_ = SIDE_UNDEFINED;
  maxTimeOperation_ = VALDEF;
}

ModelCurrentLimits::~ModelCurrentLimits() {
}

int
ModelCurrentLimits::sizeG() const {
  return 3 * nbTemporaryLimits_ + 2 * (nbLimits_ - nbTemporaryLimits_);  // I > IMax, I < IMax, t-tLim > delay (optional)
}

int
ModelCurrentLimits::sizeZ() const {
  return 0 * nbLimits_;
}

void
ModelCurrentLimits::setSide(const side_t side) {
  side_ = side;
}

void
ModelCurrentLimits::setMaxTimeOperation(const double& maxTimeOperation) {
  maxTimeOperation_ = maxTimeOperation;
}

void
ModelCurrentLimits::addLimit(const double& limit) {
  if (!std::isnan(limit)) {
    limits_.push_back(limit);
    activated_.push_back(false);
    tLimitReached_.push_back(std::numeric_limits<double>::quiet_NaN());
    nbLimits_++;
  }
}

void
ModelCurrentLimits::addAcceptableDuration(const int& acceptableDuration) {
  if (acceptableDuration == std::numeric_limits<int>::max()) {
    openingAuthorized_.push_back(false);
  } else {
    openingAuthorized_.push_back(true);
    acceptableDurations_.push_back(acceptableDuration);
    nbTemporaryLimits_++;
  }
}

void
ModelCurrentLimits::evalG(const string& /*componentName*/, const double& t, const double& current, state_g* g, const double& desactivate) {
  assert(openingAuthorized_.size() == static_cast<size_t>(nbLimits_) && "Mismatching number of limits and vector sizes");

  for (int i = 0; i < nbLimits_; ++i) {
    g[0 + 3 * i] = (current > limits_[i] && !activated_[i] && !(desactivate > 0)) ? ROOT_UP : ROOT_DOWN;  // I > Imax
    g[1 + 3 * i] = (current < limits_[i] && activated_[i] && !(desactivate > 0)) ? ROOT_UP : ROOT_DOWN;  // I < Imax
    if (openingAuthorized_[i])
        g[2 + 3 * i] = (activated_[i] && openingAuthorized_[i] && t - tLimitReached_[i] > acceptableDurations_[i] && !(desactivate > 0)
                        && acceptableDurations_[i] < maxTimeOperation_) ? ROOT_UP : ROOT_DOWN;   // t -tLim > tempo
  }
}

ModelCurrentLimits::state_t
ModelCurrentLimits::evalZ(const string& componentName, const double& t, state_g* g, ModelNetwork* network, const double& desactivate) {
  state_t state = ModelCurrentLimits::COMPONENT_CLOSE;

  for (int i = 0; i < nbLimits_; ++i) {
    if (!(desactivate > 0)) {
      if (g[0 + 3 * i] == ROOT_UP && !activated_[i]) {
        if (openingAuthorized_[i]) {  // Delay is specified => temporary limit
          network->addConstraint(componentName, true, DYNConstraint(OverloadUp, acceptableDurations_[i], side_));
        } else {
          network->addConstraint(componentName, true, DYNConstraint(IMAP, side_));
        }
        tLimitReached_[i] = t;
        activated_[i] = true;
      }

      if (g[1 + 3 * i] == ROOT_UP && activated_[i]) {
        if (openingAuthorized_[i]) {  // Delay is specified => temporary limit
          network->addConstraint(componentName, false, DYNConstraint(OverloadUp, acceptableDurations_[i], side_));
        } else {
          network->addConstraint(componentName, false, DYNConstraint(IMAP, side_));
        }
        activated_[i] = false;
        tLimitReached_[i] = std::numeric_limits<double>::quiet_NaN();
      }

      if (openingAuthorized_[i]) {
        if (g[2 + 3 * i] == ROOT_UP) {
          state = ModelCurrentLimits::COMPONENT_OPEN;
          network->addConstraint(componentName, true, DYNConstraint(OverloadOpen, acceptableDurations_[i]));
          network->addEvent(componentName, DYNTimeline(OverloadOpen, acceptableDurations_[i]));
        }
      }
    }
  }

  return state;
}

}  // namespace DYN
