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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oraffle/data/services/raffle_storage_service.dart';
import 'package:oraffle/domain/models/raffle/raffle_logo.dart';
import 'package:oraffle/presentation/feature/settings/settings_cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final RaffleStorageService _storageService = RaffleStorageService.instance;

  SettingsCubit() : super(const SettingsInitial()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final logo = await _storageService.getLogo();
    final color = await _storageService.getPrimaryColor();
    final mode = await _storageService.getThemeMode();

    emit(
      SettingsUpdated(
        companyLogo: logo,
        primaryColor: color ?? state.primaryColor,
        themeMode: mode ?? state.themeMode,
      ),
    );
  }

  void updateLogo(RaffleLogo? logo) async {
    if (logo == null) {
      await _storageService.removeLogo();
    } else {
      await _storageService.saveLogo(logo);
    }
    emit(
      SettingsUpdated(
        companyLogo: logo,
        primaryColor: state.primaryColor,
        themeMode: state.themeMode,
      ),
    );
  }

  void updatePrimaryColor(Color color) async {
    await _storageService.savePrimaryColor(color);
    emit(
      SettingsUpdated(
        companyLogo: state.companyLogo,
        primaryColor: color,
        themeMode: state.themeMode,
      ),
    );
  }

  void resetPrimaryColor() {
    updatePrimaryColor(const Color(0xFF8B5CF6));
  }

  void updateThemeMode(ThemeMode mode) async {
    await _storageService.saveThemeMode(mode);
    emit(
      SettingsUpdated(
        companyLogo: state.companyLogo,
        primaryColor: state.primaryColor,
        themeMode: mode,
      ),
    );
  }
}
