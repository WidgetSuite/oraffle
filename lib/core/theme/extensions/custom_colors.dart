// Copyright (C) 2026 Widget Suite
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color? aiIconColor;
  final Color? success;
  final Color? info;
  final Color? warning;
  final Color? warningContainer;
  final Color? onWarningContainer;
  final Color? successContainer;
  final Color? onSuccessContainer;
  final Color? winnersContainer;
  final Color? onWinnersContainer;
  final Color? goldMedal;
  final Color? silverMedal;
  final Color? copperMedal;

  const CustomColors({
    this.aiIconColor,
    this.success,
    this.info,
    this.warning,
    this.warningContainer,
    this.onWarningContainer,
    this.successContainer,
    this.onSuccessContainer,
    this.winnersContainer,
    this.onWinnersContainer,
    this.goldMedal,
    this.silverMedal,
    this.copperMedal,
  });

  @override
  CustomColors copyWith({
    Color? aiIconColor,
    Color? success,
    Color? info,
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? winnersContainer,
    Color? onWinnersContainer,
    Color? goldMedal,
    Color? silverMedal,
    Color? copperMedal,
  }) {
    return CustomColors(
      aiIconColor: aiIconColor ?? this.aiIconColor,
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      winnersContainer: winnersContainer ?? this.winnersContainer,
      onWinnersContainer: onWinnersContainer ?? this.onWinnersContainer,
      goldMedal: goldMedal ?? this.goldMedal,
      silverMedal: silverMedal ?? this.silverMedal,
      copperMedal: copperMedal ?? this.copperMedal,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      aiIconColor: Color.lerp(aiIconColor, other.aiIconColor, t),
      success: Color.lerp(success, other.success, t),
      info: Color.lerp(info, other.info, t),
      warning: Color.lerp(warning, other.warning, t),
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t),
      onWarningContainer: Color.lerp(
        onWarningContainer,
        other.onWarningContainer,
        t,
      ),
      successContainer: Color.lerp(successContainer, other.successContainer, t),
      onSuccessContainer: Color.lerp(
        onSuccessContainer,
        other.onSuccessContainer,
        t,
      ),
      winnersContainer: Color.lerp(winnersContainer, other.winnersContainer, t),
      onWinnersContainer: Color.lerp(
        onWinnersContainer,
        other.onWinnersContainer,
        t,
      ),
      goldMedal: Color.lerp(goldMedal, other.goldMedal, t),
      silverMedal: Color.lerp(silverMedal, other.silverMedal, t),
      copperMedal: Color.lerp(copperMedal, other.copperMedal, t),
    );
  }
}
