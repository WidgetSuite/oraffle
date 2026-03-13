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
import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/domain/models/raffle/raffle_logo.dart';

abstract class SettingsState {
  final RaffleLogo? companyLogo;
  final Color primaryColor;
  final ThemeMode themeMode;
  final bool hasToBlur;

  const SettingsState({
    this.companyLogo,
    required this.primaryColor,
    required this.themeMode,
    required this.hasToBlur,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SettingsState &&
        other.companyLogo == companyLogo &&
        other.primaryColor == primaryColor &&
        other.themeMode == themeMode &&
        other.hasToBlur == hasToBlur;
  }

  @override
  int get hashCode =>
      companyLogo.hashCode ^
      primaryColor.hashCode ^
      themeMode.hashCode ^
      hasToBlur.hashCode;
}

class SettingsInitial extends SettingsState {
  const SettingsInitial()
    : super(
        primaryColor: AppTheme.defaultSeedColor,
        themeMode: ThemeMode.system,
        hasToBlur: false,
      );
}

class SettingsUpdated extends SettingsState {
  const SettingsUpdated({
    super.companyLogo,
    required super.primaryColor,
    required super.themeMode,
    required super.hasToBlur,
  });
}
