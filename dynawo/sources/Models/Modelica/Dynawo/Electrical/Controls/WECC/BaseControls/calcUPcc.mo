within Dynawo.Electrical.Controls.WECC.BaseControls;

/*
* Copyright (c) 2015-2020, RTE (http://www.rte-france.com)
* See AUTHORS.txt
* All rights reserved.
* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, you can obtain one at http://mozilla.org/MPL/2.0/.
* SPDX-License-Identifier: MPL-2.0
*
* This file is part of Dynawo, an hybrid C++/Modelica open source time domain simulation tool for power systems.
*/

model calcUPcc
  import Modelica.Blocks;
  import Modelica.ComplexBlocks;
  import Dynawo.Types;

  parameter Types.PerUnit Rc "Line drop compensation resistance";
  parameter Types.PerUnit Xc "Line drop compentation reactance";

  // Inputs:
  ComplexBlocks.Interfaces.ComplexInput iPu annotation(
    Placement(visible = true, transformation(origin = {-106, 60}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-98, 60}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  ComplexBlocks.Interfaces.ComplexInput uPu annotation(
    Placement(visible = true, transformation(origin = {-110, -52}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));

  // Outputs:
  Blocks.Interfaces.RealOutput UPuLineDrop annotation(
    Placement(visible = true, transformation(origin = {112, 61}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Blocks.Interfaces.RealOutput UPu annotation(
    Placement(visible = true, transformation(origin = {112, -59}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {102, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));

equation

  UPuLineDrop = ComplexMath.'abs'(uPu + iPu * Complex(Rc,Xc));
  UPu = ComplexMath.'abs'(uPu);

  annotation(preferredView = "text",
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-4, 2}, extent = {{-66, 68}, {66, -68}}, textString = "|V-Z*I|")}));
end calcUPcc;
