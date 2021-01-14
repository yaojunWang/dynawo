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

#include "gtest_dynawo.h"

#include "DYNErrorQueue.h"
#include "DYNMacrosMessage.h"

namespace DYN {

TEST(CommonTest, testErrorQueue) {
  size_t maxDisplayedError = 100;
  ASSERT_NO_THROW(::ErrorQueueFlush());

  ::ErrorQueuePush(DYNError(DYN::Error::SIMULATION, KeyError_t::NoJobDefined));
  ASSERT_THROW_DYNAWO(::ErrorQueueFlush(), Error::SIMULATION, KeyError_t::NoJobDefined);
  ASSERT_NO_THROW(::ErrorQueueFlush());

  ::ErrorQueuePush(DYNError(DYN::Error::SIMULATION, KeyError_t::NoJobDefined));
  ::ErrorQueuePush(DYNError(DYN::Error::GENERAL, KeyError_t::CriteriaNotChecked));
  ASSERT_THROW_DYNAWO(::ErrorQueueFlush(), Error::GENERAL, KeyError_t::MultipleErrors);
  ASSERT_NO_THROW(::ErrorQueueFlush());

  for (unsigned int i = 0; i < maxDisplayedError; ++i) {
    ::ErrorQueuePush(DYNError(DYN::Error::SIMULATION, KeyError_t::NoJobDefined));
  }
  ASSERT_THROW_DYNAWO(::ErrorQueueFlush(), Error::GENERAL, KeyError_t::MultipleErrors);
  ASSERT_NO_THROW(::ErrorQueueFlush());

  for (unsigned int i = 0; i < maxDisplayedError + 1; ++i) {
    ::ErrorQueuePush(DYNError(DYN::Error::SIMULATION, KeyError_t::NoJobDefined));
  }
  ASSERT_THROW_DYNAWO(::ErrorQueueFlush(), Error::GENERAL, KeyError_t::MultipleAndHiddenErrors);
  ASSERT_NO_THROW(::ErrorQueueFlush());

  for (unsigned int i = 0; i < 2*maxDisplayedError; ++i) {
    ::ErrorQueuePush(DYNError(DYN::Error::SIMULATION, KeyError_t::NoJobDefined));
  }
  ASSERT_THROW_DYNAWO(::ErrorQueueFlush(), Error::GENERAL, KeyError_t::MultipleAndHiddenErrors);
  ASSERT_NO_THROW(::ErrorQueueFlush());
}

}  // namespace DYN
