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

  const CustomColors({
    this.aiIconColor,
    this.success,
    this.info,
    this.warning,
    this.warningContainer,
    this.onWarningContainer,
  });

  @override
  CustomColors copyWith({
    Color? aiIconColor,
    Color? success,
    Color? info,
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
  }) {
    return CustomColors(
      aiIconColor: aiIconColor ?? this.aiIconColor,
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
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
    );
  }
}
