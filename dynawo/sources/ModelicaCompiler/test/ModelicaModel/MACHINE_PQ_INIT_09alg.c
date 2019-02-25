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

/* Algebraic */
/* Simulation code for MACHINE_PQ_INIT generated by the OpenModelica Compiler OMCompiler v1.9.4. */

#include "openmodelica.h"
#include "openmodelica_func.h"
#include "simulation_data.h"
#include "simulation/simulation_info_json.h"
#include "simulation/simulation_runtime.h"
#include "util/omc_error.h"
#include "simulation/solver/model_help.h"
#include "simulation/solver/delay.h"
#include "simulation/solver/linearSystem.h"
#include "simulation/solver/nonlinearSystem.h"
#include "simulation/solver/mixedSystem.h"

#include <string.h>

#include "MACHINE_PQ_INIT_functions.h"
#include "MACHINE_PQ_INIT_model.h"
#include "MACHINE_PQ_INIT_literals.h"




#if defined(HPCOM) && !defined(_OPENMP)
  #error "HPCOM requires OpenMP or the results are wrong"
#endif
#if defined(_OPENMP)
  #include <omp.h>
#else
  /* dummy omp defines */
  #define omp_get_max_threads() 1
#endif

#ifdef __cplusplus
extern "C" {
#endif


/* forwarded equations */
extern void MACHINE_PQ_INIT_eqFunction_14(DATA* data, threadData_t *threadData);
extern void MACHINE_PQ_INIT_eqFunction_13(DATA* data, threadData_t *threadData);
extern void MACHINE_PQ_INIT_eqFunction_8(DATA* data, threadData_t *threadData);
extern void MACHINE_PQ_INIT_eqFunction_9(DATA* data, threadData_t *threadData);
extern void MACHINE_PQ_INIT_eqFunction_10(DATA* data, threadData_t *threadData);
extern void MACHINE_PQ_INIT_eqFunction_11(DATA* data, threadData_t *threadData);
extern void MACHINE_PQ_INIT_eqFunction_12(DATA* data, threadData_t *threadData);

static void functionAlg_system0(DATA *data, threadData_t *threadData)
{
  MACHINE_PQ_INIT_eqFunction_14(data, threadData);

  MACHINE_PQ_INIT_eqFunction_13(data, threadData);

  MACHINE_PQ_INIT_eqFunction_8(data, threadData);

  MACHINE_PQ_INIT_eqFunction_9(data, threadData);

  MACHINE_PQ_INIT_eqFunction_10(data, threadData);

  MACHINE_PQ_INIT_eqFunction_11(data, threadData);

  MACHINE_PQ_INIT_eqFunction_12(data, threadData);
}
/* for continuous time variables */
int MACHINE_PQ_INIT_functionAlgebraics(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  functionAlg_system0(data, threadData);

  MACHINE_PQ_INIT_function_savePreSynchronous(data, threadData);
  
  TRACE_POP
  return 0;
}

#ifdef __cplusplus
}
#endif