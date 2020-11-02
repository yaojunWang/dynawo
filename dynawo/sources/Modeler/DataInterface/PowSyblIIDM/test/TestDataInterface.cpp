//
// Copyright (c) 2015-2020, RTE (http://www.rte-france.com)
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
 * @file Modeler/DataInterface/test/TestIIDMModels.cpp
 * @brief Unit tests for DataInterface/*IIDM classes
 *
 */


#include "gtest_dynawo.h"
#include "DYNDataInterfaceIIDM.h"
#include "DYNSubModelFactory.h"
#include "DYNSubModel.h"
#include "PARParametersSetFactory.h"
#include "DYNModelMulti.h"
#include "DYNNetworkInterface.h"
#include "DYNTwoWTransformerInterface.h"
#include "DYNModelConstants.h"
#include "DYNVoltageLevelInterface.h"
#include "DYNLoadInterface.h"

#include <powsybl/iidm/Network.hpp>
#include <powsybl/iidm/Substation.hpp>
#include <powsybl/iidm/SubstationAdder.hpp>
#include <powsybl/iidm/VoltageLevel.hpp>
#include <powsybl/iidm/Bus.hpp>
#include <powsybl/iidm/Load.hpp>
#include <powsybl/iidm/LoadAdder.hpp>
#include <powsybl/iidm/Switch.hpp>
#include <powsybl/iidm/Line.hpp>
#include <powsybl/iidm/LineAdder.hpp>
#include <powsybl/iidm/TwoWindingsTransformerAdder.hpp>
#include <powsybl/iidm/RatioTapChangerAdder.hpp>
#include <powsybl/iidm/PhaseTapChangerAdder.hpp>
#include <powsybl/iidm/ThreeWindingsTransformerAdder.hpp>
#include <powsybl/iidm/DanglingLine.hpp>
#include <powsybl/iidm/DanglingLineAdder.hpp>
#include <powsybl/iidm/VscConverterStation.hpp>
#include <powsybl/iidm/VscConverterStationAdder.hpp>
#include <powsybl/iidm/HvdcLine.hpp>
#include <powsybl/iidm/HvdcLineAdder.hpp>
#include <powsybl/iidm/LccConverterStation.hpp>
#include <powsybl/iidm/LccConverterStationAdder.hpp>
#include <powsybl/iidm/ShuntCompensator.hpp>
#include <powsybl/iidm/ShuntCompensatorAdder.hpp>

using boost::shared_ptr;

namespace DYN {

shared_ptr<DataInterface>
createDataItfFromNetwork(powsybl::iidm::Network& network) {
  shared_ptr<DataInterface> data;
  DataInterfaceIIDM* ptr = new DataInterfaceIIDM(network);
  ptr->initFromIIDM();
  data.reset(ptr);
  return data;
}

powsybl::iidm::Network
createNodeBreakerNetworkIIDM() {
  powsybl::iidm::Network network("MyNetwork", "MyNetwork");

  powsybl::iidm::Substation& substation = network.newSubstation()
                                     .setId("MySubStation")
                                     .setName("MySubStation_NAME")
                                     .setTso("TSO")
                                     .add();

  powsybl::iidm::VoltageLevel& vl = substation.newVoltageLevel()
                                     .setId("MyVoltageLevel")
                                     .setName("MyVoltageLevel_NAME")
                                     .setTopologyKind(powsybl::iidm::TopologyKind::NODE_BREAKER)
                                     .setNominalVoltage(190.)
                                     .setLowVoltageLimit(120.)
                                     .setHighVoltageLimit(150.)
                                     .add();
  vl.getNodeBreakerView().newBusbarSection()
      .setId("BBS")
      .setName("BBS_NAME")
      .setNode(0)
      .add();
  vl.getNodeBreakerView().newBusbarSection()
      .setId("BBS2")
      .setName("BBS2_NAME")
      .setNode(1)
      .add();
  vl.getNodeBreakerView().newBreaker()
      .setId("BK1")
      .setNode1(0)
      .setNode2(1)
      .setRetained(false)
      .setOpen(false)
      .add();

  powsybl::iidm::Bus& calculatedIIDMBus = vl.getBusBreakerView().getBus("MyVoltageLevel_0").get();
  calculatedIIDMBus.setV(110.);
  calculatedIIDMBus.setAngle(1.5);
  return network;
}

struct BusBreakerNetworkProperty {
  bool instantiateCapacitorShuntCompensator;
  bool instantiateStaticVarCompensator;
  bool instantiateTwoWindingTransformer;
  bool instantiateRatioTapChanger;
  bool instantiatePhaseTapChanger;
  bool instantiateDanglingLine;
  bool instantiateGenerator;
  bool instantiateLccConverter;
  bool instantiateLine;
  bool instantiateLoad;
  bool instantiateSwitch;
  bool instantiateVscConverter;
  bool instantiateThreeWindingTransformer;
};

powsybl::iidm::Network
createBusBreakerNetwork(const BusBreakerNetworkProperty& properties) {
  powsybl::iidm::Network network("MyNetwork", "MyNetwork");

  powsybl::iidm::Substation& s = network.newSubstation()
      .setId("MySubStation")
      .add();

  powsybl::iidm::VoltageLevel& vl1 = s.newVoltageLevel()
      .setId("VL1")
      .setNominalVoltage(150.)
      .setTopologyKind(powsybl::iidm::TopologyKind::BUS_BREAKER)
      .add();

  powsybl::iidm::Bus& iidmBus = vl1.getBusBreakerView().newBus()
      .setId("MyBus")
      .add();
  iidmBus.setV(150.);
  iidmBus.setAngle(1.5);
  vl1.getBusBreakerView().newBus().setId("VL1_BUS1").add();
  powsybl::iidm::VoltageLevel& vl2 = s.newVoltageLevel()
                                     .setId("VL2")
                                     .setName("VL2_NAME")
                                     .setTopologyKind(powsybl::iidm::TopologyKind::BUS_BREAKER)
                                     .setNominalVoltage(225.0)
                                     .setLowVoltageLimit(200.0)
                                     .setHighVoltageLimit(260.0)
                                     .add();

  vl2.getBusBreakerView().newBus().setId("VL2_BUS1").add();
  powsybl::iidm::VoltageLevel& vl3 = s.newVoltageLevel()
                                     .setId("VL3")
                                     .setName("VL3_NAME")
                                     .setTopologyKind(powsybl::iidm::TopologyKind::BUS_BREAKER)
                                     .setNominalVoltage(225.0)
                                     .setLowVoltageLimit(200.0)
                                     .setHighVoltageLimit(260.0)
                                     .add();

  vl3.getBusBreakerView().newBus().setId("VL3_BUS1").add();

  if (properties.instantiateDanglingLine) {
    powsybl::iidm::DanglingLine& dl = vl1.newDanglingLine()
         .setId("MyDanglingLine")
         .setBus("MyBus")
         .setConnectableBus("MyBus")
         .setName("MyDanglingLine_NAME")
         .setB(3.0)
         .setG(3.0)
         .setP0(105.0)
         .setQ0(90.0)
         .setR(3.0)
         .setX(3.0)
         .setUcteXnodeCode("ucteXnodeCodeTest")
         .add();
    dl.newCurrentLimits().setPermanentLimit(200).beginTemporaryLimit().setName("TL1").setValue(10.).setAcceptableDuration(5.).endTemporaryLimit().add();
    dl.getTerminal().setP(105.);
    dl.getTerminal().setQ(90.);
  }

  if (properties.instantiateLoad) {
    powsybl::iidm::Load& load = vl1.newLoad()
        .setId("MyLoad")
        .setBus("MyBus")
        .setConnectableBus("MyBus")
        .setName("LOAD1_NAME")
        .setLoadType(powsybl::iidm::LoadType::UNDEFINED)
        .setP0(105.0)
        .setQ0(90.0)
        .add();
    load.getTerminal().setP(105.);
    load.getTerminal().setQ(90.);
  }

  if (properties.instantiateSwitch) {
    vl1.getBusBreakerView().newSwitch()
        .setId("Sw")
        .setName("SwName")
        .setFictitious(false)
        .setBus1("MyBus")
        .setBus2("VL1_BUS1")
        .add();
  }

  if (properties.instantiateGenerator) {
    // TODO(rosiereflo)
//    IIDM::builders::GeneratorBuilder gb;
//    IIDM::MinMaxReactiveLimits limits(1., 20.);
//    gb.minMaxReactiveLimits(limits);
//    gb.targetP(-105.);
//    gb.pmin(-150.);
//    gb.pmax(200.);
//    gb.energySource(IIDM::Generator::source_nuclear);
//    IIDM::Generator g = gb.build("MyGenerator");
//    g.p(-105.);
//    g.q(-90.);
//    g.targetQ(-90.);
//    g.targetV(150.);
//    g.connectTo("MyVoltageLevel", p1);
//    vl.add(g);
  }

  if (properties.instantiateVscConverter) {
    powsybl::iidm::VscConverterStation& vsc = vl1.newVscConverterStation()
        .setId("MyVscConverter")
        .setName("MyVscConverter_NAME")
        .setBus("MyBus")
        .setConnectableBus("MyBus")
        .setLossFactor(3.0)
        .setVoltageRegulatorOn(true)
        .setVoltageSetpoint(1.2)
        .setReactivePowerSetpoint(-1.5)
        .add();
    vsc.getTerminal().setP(150.);
    vsc.getTerminal().setQ(90.);

    powsybl::iidm::VscConverterStation& vsc2 = vl1.newVscConverterStation()
        .setId("MyVscConverter2")
        .setName("MyVscConverter2_NAME")
        .setBus("MyBus")
        .setConnectableBus("MyBus")
        .setLossFactor(3.0)
        .setVoltageRegulatorOn(true)
        .setVoltageSetpoint(1.2)
        .setReactivePowerSetpoint(-1.5)
        .add();
    vsc2.getTerminal().setP(150.);
    vsc2.getTerminal().setQ(90.);

    powsybl::iidm::HvdcLine& hvdcIIDM = network.newHvdcLine()
        .setId("MyHvdcLine")
        .setName("MyHvdcLine_NAME")
        .setActivePowerSetpoint(111.1)
        .setConvertersMode(powsybl::iidm::HvdcLine::ConvertersMode::SIDE_1_RECTIFIER_SIDE_2_INVERTER)
        .setConverterStationId1("MyVscConverter")
        .setConverterStationId2("MyVscConverter2")
        .setMaxP(12.0)
        .setNominalVoltage(13.0)
        .setR(14.0)
        .add();
  }

  if (properties.instantiateLccConverter) {
    powsybl::iidm::LccConverterStation& lcc = vl1.newLccConverterStation()
        .setId("MyLccConverter")
        .setName("MyLccConverter_NAME")
        .setBus("MyBus")
        .setConnectableBus("MyBus")
        .setLossFactor(3.0)
        .setPowerFactor(1.)
        .add();
    lcc.getTerminal().setP(105.);
    lcc.getTerminal().setQ(90.);

    powsybl::iidm::LccConverterStation& lcc2 = vl1.newLccConverterStation()
        .setId("MyLccConverter2")
        .setName("MyLccConverter2_NAME")
        .setBus("MyBus")
        .setConnectableBus("MyBus")
        .setLossFactor(3.0)
        .setPowerFactor(1.)
        .add();
    lcc2.getTerminal().setP(105.);
    lcc2.getTerminal().setQ(90.);

    powsybl::iidm::HvdcLine& hvdcIIDM = network.newHvdcLine()
        .setId("MyHvdcLine")
        .setName("MyHvdcLine_NAME")
        .setActivePowerSetpoint(111.1)
        .setConvertersMode(powsybl::iidm::HvdcLine::ConvertersMode::SIDE_1_RECTIFIER_SIDE_2_INVERTER)
        .setConverterStationId1("MyLccConverter")
        .setConverterStationId2("MyLccConverter2")
        .setMaxP(12.0)
        .setNominalVoltage(13.0)
        .setR(14.0)
        .add();
  }

  if (properties.instantiateCapacitorShuntCompensator) {
    powsybl::iidm::ShuntCompensator& shuntIIDM = vl1.newShuntCompensator()
        .setId("MyCapacitorShuntCompensator")
        .setName("MyCapacitorShuntCompensator_NAME")
        .setBus("MyBus")
        .setConnectableBus("MyBus")
        .setbPerSection(2.0)
        .setCurrentSectionCount(2UL)
        .setMaximumSectionCount(3UL)
        .add();
    shuntIIDM.getTerminal().setQ(90.);
  }

  if (properties.instantiateStaticVarCompensator) {
    // TODO(rosiereflo)
//    IIDM::builders::StaticVarCompensatorBuilder svcb;
//    svcb.regulationMode(IIDM::StaticVarCompensator::regulation_reactive_power);
//    svcb.bmin(1.0);
//    svcb.bmax(10.0);
//    svcb.p(105.);
//    svcb.q(90.);
//    IIDM::StaticVarCompensator svc = svcb.build("MyStaticVarCompensator");
//    IIDM::extensions::standbyautomaton::StandbyAutomatonBuilder sbab;
//    sbab.standBy(true);
//    svc.setExtension(sbab.build());
//    vl.add(svc, c1);
  }

  if (properties.instantiateTwoWindingTransformer) {
    powsybl::iidm::TwoWindingsTransformer& transformer = s.newTwoWindingsTransformer()
        .setId("MyTransformer2Winding")
        .setVoltageLevel1(vl1.getId())
        .setBus1("MyBus")
        .setConnectableBus1("MyBus")
        .setVoltageLevel2(vl2.getId())
        .setBus2("VL2_BUS1")
        .setConnectableBus2("VL2_BUS1")
        .setR(3.0)
        .setX(33.0)
        .setG(1.0)
        .setB(0.2)
        .setRatedU1(2.0)
        .setRatedU2(0.4)
        .setRatedS(3.0)
        .add();
    transformer.getTerminal1().setP(100.);
    transformer.getTerminal1().setQ(110.);
    transformer.getTerminal2().setP(120.);
    transformer.getTerminal2().setQ(130.);
    if (properties.instantiateRatioTapChanger) {
      transformer.newRatioTapChanger()
          .setTapPosition(1)
          .beginStep()
          .setR(1.)
          .setX(1.)
          .setG(1.)
          .setB(1.)
          .setRho(1.)
          .endStep()
          .beginStep()
          .setR(2.)
          .setX(1.)
          .setG(1.)
          .setB(1.)
          .setRho(1.)
          .endStep()
          .add();
    }
    if (properties.instantiatePhaseTapChanger) {
      transformer.newPhaseTapChanger()
          .setTapPosition(2)
          .beginStep()
          .setAlpha(1.)
          .setR(1.)
          .setX(1.)
          .setG(1.)
          .setB(1.)
          .setRho(1.)
          .endStep()
          .beginStep()
          .setAlpha(1.)
          .setR(2.)
          .setX(1.)
          .setG(1.)
          .setB(1.)
          .setRho(1.)
          .endStep()
          .beginStep()
          .setAlpha(1.)
          .setR(3.)
          .setX(1.)
          .setG(1.)
          .setB(1.)
          .setRho(1.)
          .endStep()
          .add();
    }
  }

  if (properties.instantiateThreeWindingTransformer) {
    powsybl::iidm::ThreeWindingsTransformer& transformer = s.newThreeWindingsTransformer()
        .setId("MyTransformer3Winding")
        .setName("MyTransformer3Winding_NAME")
        .newLeg1()
        .setR(1.3)
        .setX(1.4)
        .setG(1.6)
        .setB(1.7)
        .setRatedU(1.1)
        .setRatedS(2.2)
        .setVoltageLevel(vl1.getId())
        .setBus("MyBus")
        .setConnectableBus("MyBus")
        .add()
        .newLeg2()
        .setR(2.3)
        .setX(2.4)
        .setG(0.0)
        .setB(0.0)
        .setRatedU(2.1)
        .setVoltageLevel(vl2.getId())
        .setBus("VL2_BUS1")
        .setConnectableBus("VL2_BUS1")
        .add()
        .newLeg3()
        .setR(3.3)
        .setX(3.4)
        .setG(0.0)
        .setB(0.0)
        .setRatedU(3.1)
        .setVoltageLevel(vl3.getId())
        .setBus("VL3_BUS1")
        .setConnectableBus("VL3_BUS1")
        .add()
        .add();
    transformer.getLeg1().newCurrentLimits().setPermanentLimit(200).beginTemporaryLimit().
        setName("TL1").setValue(10.).setAcceptableDuration(5.).endTemporaryLimit().add();
    transformer.getLeg2().newCurrentLimits().setPermanentLimit(200).beginTemporaryLimit().
        setName("TL1").setValue(10.).setAcceptableDuration(5.).endTemporaryLimit().add();
    transformer.getLeg3().newCurrentLimits().setPermanentLimit(200).beginTemporaryLimit().
        setName("TL1").setValue(20.).setAcceptableDuration(5.).endTemporaryLimit().add();
  }

  if (properties.instantiateLine) {
    powsybl::iidm::Line& line = network.newLine()
                                      .setId("VL1_VL2")
                                      .setName("VL1_VL2_NAME")
                                      .setVoltageLevel1(vl1.getId())
                                      .setBus1("MyBus")
                                      .setConnectableBus1("MyBus")
                                      .setVoltageLevel2(vl2.getId())
                                      .setBus2("VL2_BUS1")
                                      .setConnectableBus2("VL2_BUS1")
                                      .setR(3.0)
                                      .setX(33.33)
                                      .setG1(1.0)
                                      .setB1(0.2)
                                      .setG2(2.0)
                                      .setB2(0.4)
                                      .add();
    line.getTerminal1().setP(105.);
    line.getTerminal1().setQ(190.);
    line.getTerminal2().setP(150.);
    line.getTerminal2().setQ(180.);
    line.newCurrentLimits1().beginTemporaryLimit().setName("TL1").setValue(10.).setAcceptableDuration(5.).endTemporaryLimit().add();
    line.newCurrentLimits2().beginTemporaryLimit().setName("TL2").setValue(20.).setAcceptableDuration(5.).endTemporaryLimit().add();
  }
  return network;
}

shared_ptr<SubModel>
initializeModel(shared_ptr<DataInterface> data) {
  shared_ptr<SubModel> modelNetwork = SubModelFactory::createSubModelFromLib("../../../../Models/CPP/ModelNetwork/DYNModelNetwork" +
                                                std::string(sharedLibraryExtension()));
  modelNetwork->initFromData(data);
  data->setModelNetwork(modelNetwork);
  modelNetwork->name("NETWORK");
  shared_ptr<parameters::ParametersSet> parametersSet = parameters::ParametersSetFactory::newInstance("Parameterset");
  parametersSet->createParameter("bus_uMax", 0.);
  parametersSet->createParameter("capacitor_no_reclosing_delay", 0.);
  parametersSet->createParameter("load_alpha", 0.);
  parametersSet->createParameter("load_beta", 0.);
  parametersSet->createParameter("load_isRestorative", false);
  parametersSet->createParameter("load_isControllable", false);
  if (!data->getNetwork()->getTwoWTransformers().empty() && data->getNetwork()->getTwoWTransformers()[0]->getRatioTapChanger()) {
    parametersSet->createParameter("transformer_t1st_THT", 9.);
    parametersSet->createParameter("transformer_tNext_THT", 10.);
    parametersSet->createParameter("transformer_t1st_HT", 11.);
    parametersSet->createParameter("transformer_tNext_HT", 12.);
    parametersSet->createParameter("transformer_tolV", 13.);
  }
  modelNetwork->setPARParameters(parametersSet);

  return modelNetwork;
}

void
exportStateVariables(shared_ptr<DataInterface> data) {
  shared_ptr<SubModel> modelNetwork = initializeModel(data);
  ModelMulti mm;
  mm.addSubModel(modelNetwork, "MyLib");
  mm.initBuffers();
  mm.init(0.0);
  data->getStateVariableReference();
  data->exportStateVariables();
  data->updateFromModel(false);
  data->importStaticParameters();
}

TEST(DataInterfaceIIDMTest, testNodeBreakerBusIIDMAndStaticParameters) {
  powsybl::iidm::Network network = createNodeBreakerNetworkIIDM();
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_EQ(data->getStaticParameterDoubleValue("MyVoltageLevel_0", "U"), 110.);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyVoltageLevel_0", "Teta"), 1.5);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyVoltageLevel_0", "Upu"), 110./190.);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyVoltageLevel_0", "Teta_pu"), 1.5 * M_PI / 180);

  ASSERT_EQ(data->getBusName("MyVoltageLevel_0", ""), "MyVoltageLevel_0");
}

TEST(DataInterfaceIIDMTest, testBusIIDMStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_EQ(data->getStaticParameterDoubleValue("MyBus", "U"), 150.);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyBus", "Teta"), 1.5);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyBus", "Upu"), 1.);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyBus", "Teta_pu"), 1.5 * M_PI / 180);
  ASSERT_EQ(data->getBusName("MyBus", ""), "MyBus");
}


TEST(DataInterfaceIIDMTest, testDanglingLineIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      true /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyDanglingLine", "p_pu"), 1.05);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyDanglingLine", "q_pu"), 0.9);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyDanglingLine", "p"), 105);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyDanglingLine", "q"), 90);
}

// TEST(DataInterfaceIIDMTest, testGeneratorIIDMAndStaticParameters) {
//  const BusBreakerNetworkProperty properties = {
//      false /*instantiateCapacitorShuntCompensator*/,
//      false /*instantiateStaticVarCompensator*/,
//      false /*instantiateTwoWindingTransformer*/,
//      false /*instantiateRatioTapChanger*/,
//      false /*instantiatePhaseTapChanger*/,
//      false /*instantiateDanglingLine*/,
//      true /*instantiateGenerator*/,
//      false /*instantiateLccConverter*/,
//      false /*instantiateLine*/,
//      false /*instantiateLoad*/,
//      false /*instantiateSwitch*/,
//      false /*instantiateVscConverter*/,
//      false /*instantiateThreeWindingTransformer*/
//  };
//  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
//  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
//  exportStateVariables(data);
//
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "p_pu"), -105. / SNREF);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "q_pu"), -90. / SNREF);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "p"), -105.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "q"), -90.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "v_pu"), 1.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "angle_pu"), 0.02617993877991494148);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "uc_pu"), 1.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "v"), 150.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "uc"), 150.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "angle"), 1.5);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "pMin"), -150.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "pMax"), 200.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "pMin_pu"), -150. / SNREF);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "pMax_pu"), 200. / SNREF);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "qMax"), 20);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "qMax_pu"), 20. / SNREF);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "qMin"), 1);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "qMin_pu"), 1. / SNREF);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "sNom"), sqrt(20 * 20 + 200 * 200));
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "vNom"), 150);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "targetV"), 150.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "targetV_pu"), 1.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "targetP_pu"), 105. / SNREF);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "targetP"), 105.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "targetQ_pu"), 90. / SNREF);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyGenerator", "targetQ"), 90.);
//}


TEST(DataInterfaceIIDMTest, testHvdcLineIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      true /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter", "p_pu"), -150. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter", "q_pu"), -90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter", "p"), -150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter", "q"), -90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter", "v_pu"), 11.538461538461538);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter", "angle_pu"), 0.02617993877991494148);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter", "v"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter", "angle"), 1.5);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter2", "p_pu"), -150. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter2", "q_pu"), -90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter2", "p"), -150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter2", "q"), -90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter2", "v_pu"), 11.538461538461538);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter2", "angle_pu"), 0.02617993877991494148);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter2", "v"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyVscConverter2", "angle"), 1.5);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "p1_pu"), 150. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "q1_pu"), 90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "p2_pu"), 150. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "q2_pu"), 90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "p1"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "q1"), 90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "p2"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "q2"), 90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "v1_pu"), 1.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "angle1_pu"), 0.02617993877991494148);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "v1"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "angle1"), 1.5);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "v2_pu"), 1.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "angle2_pu"), 0.02617993877991494148);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "v2"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "angle2"), 1.5);
}

TEST(DataInterfaceIIDMTest, testLccConverterIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      true /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter", "p_pu"), -105. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter", "q_pu"), -90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter", "p"), -105.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter", "q"), -90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter", "v_pu"), 11.538461538461538);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter", "angle_pu"), 0.026179938779914941);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter", "v"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter", "angle"), 1.5);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter2", "p_pu"), -105. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter2", "q_pu"), -90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter2", "p"), -105.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter2", "q"), -90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter2", "v_pu"), 11.538461538461538);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter2", "angle_pu"), 0.026179938779914941);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter2", "v"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLccConverter2", "angle"), 1.5);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "p1_pu"), 105. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "q1_pu"), 90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "p2_pu"), 105. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "q2_pu"), 90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "p1"), 105.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "q1"), 90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "p2"), 105.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "q2"), 90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "v1_pu"), 1.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "angle1_pu"), 0.02617993877991494148);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "v1"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "angle1"), 1.5);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "v2_pu"), 1.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "angle2_pu"), 0.02617993877991494148);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "v2"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyHvdcLine", "angle2"), 1.5);
}

TEST(DataInterfaceIIDMTest, testLineIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      true /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_THROW_DYNAWO(data->getStaticParameterDoubleValue("VL1_VL2", "p_pu"), Error::MODELER, KeyError_t::UnknownStaticParameter);
  ASSERT_EQ(data->getBusName("VL1_VL2", ""), "");
}

TEST(DataInterfaceIIDMTest, testLoadIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      true /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "p_pu"), 105. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "p0_pu"), 105. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "q_pu"), 90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "q0_pu"), 90. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "p"), 105.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "p0"), 105.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "q"), 90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "q0"), 90.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "v_pu"), 1.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "angle_pu"), 0.02617993877991494148);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "v"), 150.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyLoad", "angle"), 1.5);
  ASSERT_EQ(data->getBusName("MyLoad", ""), "MyBus");
}

TEST(DataInterfaceIIDMTest, testShuntCompensatorIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      true /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyCapacitorShuntCompensator", "q_pu"), -90000. / SNREF);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyCapacitorShuntCompensator", "q"), -90000.);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterBoolValue("MyCapacitorShuntCompensator", "isCapacitor"), 1.);
}

// TEST(DataInterfaceIIDMTest, testStaticVarCompensatorIIDMAndStaticParameters) {
//  const BusBreakerNetworkProperty properties = {
//      false /*instantiateCapacitorShuntCompensator*/,
//      true /*instantiateStaticVarCompensator*/,
//      false /*instantiateTwoWindingTransformer*/,
//      false /*instantiateRatioTapChanger*/,
//      false /*instantiatePhaseTapChanger*/,
//      false /*instantiateDanglingLine*/,
//      false /*instantiateGenerator*/,
//      false /*instantiateLccConverter*/,
//      false /*instantiateLine*/,
//      false /*instantiateLoad*/,
//      false /*instantiateSwitch*/,
//      false /*instantiateVscConverter*/,
//      false /*instantiateThreeWindingTransformer*/
//  };
//  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
//  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
//  exportStateVariables(data);
//
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyStaticVarCompensator", "p"), 0.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyStaticVarCompensator", "q"), 90.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterIntValue("MyStaticVarCompensator", "regulatingMode"), 2);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyStaticVarCompensator", "v"), 150.);
//  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyStaticVarCompensator", "angle"), 1.5);
//}

TEST(DataInterfaceIIDMTest, testSwitchIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      true /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);
  ASSERT_EQ(data->getBusName("Sw", ""), "");
}

TEST(DataInterfaceIIDMTest, testRatioTwoWindingTransformerIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      true /*instantiateTwoWindingTransformer*/,
      true /*instantiateRatioTapChanger*/,
      true /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      true /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  double a = data->getStaticParameterDoubleValue("MyTransformer2Winding", "p1_pu");
  double b = data->getStaticParameterDoubleValue("MyTransformer2Winding", "p2_pu");
  double c = data->getStaticParameterDoubleValue("MyTransformer2Winding", "q1_pu");
  double d = data->getStaticParameterDoubleValue("MyTransformer2Winding", "q2_pu");
  double e = data->getStaticParameterDoubleValue("MyTransformer2Winding", "i1");
  double f = data->getStaticParameterDoubleValue("MyTransformer2Winding", "i2");
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "p1_pu"), 9.2043642724743098);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "p2_pu"), -0.0011838723553420131);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "q1_pu"), -1.5798045729283614);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "q2_pu"), -0.0084962943718131304);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "p1"), 920.43642724743098);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "p2"), -0.11838723553420131);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "q1"), -157.98045729283614);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "q2"), -0.84962943718131304);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "i1"), 9.338956266577485);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "i2"), 1.9301350853479737);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "iMax"), 259.80502305912023);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "iStop"), 259.80502305912023);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "regulating"), 0);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "increasePhase"), -1);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "tapPosition"), 2);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "lowTapPosition"), 0);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "highTapPosition"), 2);
  ASSERT_EQ(data->getBusName("MyTransformer2Winding", ""), "");
}

TEST(DataInterfaceIIDMTest, testTwoWindingTransformerIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      true /*instantiateTwoWindingTransformer*/,
      true /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      true /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "p1_pu"), 9.1139982127973873);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "p2_pu"), -0.0010255087406258725);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "q1_pu"), -1.5591740692665068);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "q2_pu"), -0.0086036345858491441);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "p1"), 911.39982127973873);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "p2"), -0.10255087406258725);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "q1"), -155.91740692665068);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "q2"), -0.86036345858491441);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "i1"), 9.2464040145965409);
  ASSERT_DOUBLE_EQUALS_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "i2"), 1.9495207579969318);
  ASSERT_THROW_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "iMax"), Error::MODELER, KeyError_t::UnknownStaticParameter);
  ASSERT_THROW_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "iStop"), Error::MODELER, KeyError_t::UnknownStaticParameter);
  ASSERT_THROW_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "regulating"), Error::MODELER, KeyError_t::UnknownStaticParameter);
  ASSERT_THROW_DYNAWO(data->getStaticParameterDoubleValue("MyTransformer2Winding", "increasePhase"), Error::MODELER, KeyError_t::UnknownStaticParameter);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "tapPosition"), 1);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "lowTapPosition"), 0);
  ASSERT_EQ(data->getStaticParameterDoubleValue("MyTransformer2Winding", "highTapPosition"), 1);
  ASSERT_EQ(data->getBusName("MyTransformer2Winding", ""), "");
}

TEST(DataInterfaceIIDMTest, testThreeWindingTransformerIIDMAndStaticParameters) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      false /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      true /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);
  ASSERT_EQ(data->getBusName("MyTransformer3Winding", ""), "");
}

TEST(DataInterfaceIIDMTest, testBadlyFormedStaticRefModel) {
  const BusBreakerNetworkProperty properties = {
      false /*instantiateCapacitorShuntCompensator*/,
      false /*instantiateStaticVarCompensator*/,
      false /*instantiateTwoWindingTransformer*/,
      false /*instantiateRatioTapChanger*/,
      false /*instantiatePhaseTapChanger*/,
      false /*instantiateDanglingLine*/,
      false /*instantiateGenerator*/,
      false /*instantiateLccConverter*/,
      false /*instantiateLine*/,
      true /*instantiateLoad*/,
      false /*instantiateSwitch*/,
      false /*instantiateVscConverter*/,
      false /*instantiateThreeWindingTransformer*/
  };
  powsybl::iidm::Network network = createBusBreakerNetwork(properties);
  shared_ptr<DataInterface> data = createDataItfFromNetwork(network);
  exportStateVariables(data);

  boost::shared_ptr<LoadInterface> loadItf = data->getNetwork()->getVoltageLevels()[0]->getLoads()[0];
  ASSERT_NO_THROW(data->setReference("p", "MyLoad", "MyLoad", "P_value"));
  ASSERT_THROW_DYNAWO(data->setReference("badParam", loadItf->getID(), "MyLoad", "p_pu"), Error::MODELER, KeyError_t::UnknownStateVariable);
  ASSERT_THROW_DYNAWO(data->setReference("p", "", "MyLoad", "p_pu"), Error::MODELER, KeyError_t::WrongReferenceId);
  ASSERT_NO_THROW(data->setReference("p", "MyLoad", "MyLoad", "myBadModelVar"));
  ASSERT_THROW_DYNAWO(data->getStateVariableReference(), Error::MODELER, KeyError_t::StateVariableNoReference);
  const bool filterForCriteriaCheck = false;
  ASSERT_NO_THROW(data->updateFromModel(filterForCriteriaCheck));

  // Reset
  powsybl::iidm::Network network2 = createBusBreakerNetwork(properties);
  data = createDataItfFromNetwork(network2);
  exportStateVariables(data);
  loadItf = data->getNetwork()->getVoltageLevels()[0]->getLoads()[0];
  ASSERT_NO_THROW(data->setReference("p", "MyLoad", "MyBadLoad", "p_pu"));
  ASSERT_THROW_DYNAWO(data->getStateVariableReference(), Error::MODELER, KeyError_t::StateVariableNoReference);
  ASSERT_NO_THROW(data->updateFromModel(filterForCriteriaCheck));

  // Reset
  powsybl::iidm::Network network3 = createBusBreakerNetwork(properties);
  data = createDataItfFromNetwork(network3);
  exportStateVariables(data);
  loadItf = data->getNetwork()->getVoltageLevels()[0]->getLoads()[0];
  ASSERT_THROW_DYNAWO(data->setReference("p", "MyBadLoad", "MyLoad", "p_pu"), Error::MODELER, KeyError_t::UnknownStaticComponent);
}

}  // namespace DYN
