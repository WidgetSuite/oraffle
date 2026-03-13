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

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oraffle/domain/models/raffle/raffle_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for handling raffle-specific persistent storage
class RaffleStorageService {
  static const String _raffleLogo = 'raffle_logo';
  static const String _raffleLogoType = 'raffle_logo_type';
  static const String _raffleLogoFilename = 'raffle_logo_filename';
  static const String _primaryColor = 'primary_color';
  static const String _themeMode = 'theme_mode';
  static const String _hasToBlur = 'has_to_blur';
  // Maximum size for base64 encoded image (approximately 2MB in base64)
  static const int _maxBase64Size = 2 * 1024 * 1024; // 2MB in bytes

  static RaffleStorageService? _instance;
  static RaffleStorageService get instance =>
      _instance ??= RaffleStorageService._();

  RaffleStorageService._();

  /// Saves a RaffleLogo to persistent storage
  Future<bool> saveLogo(RaffleLogo logo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final base64String = base64Encode(logo.data);

      if (base64String.length > _maxBase64Size) {
        if (kDebugMode) {
          print(
            'Logo too large for storage: ${base64String.length} bytes. Max allowed: $_maxBase64Size bytes',
          );
        }
        return false; // Logo too large
      }

      await prefs.setString(_raffleLogo, base64String);
      await prefs.setString(_raffleLogoType, logo.type);
      if (logo.filename != null) {
        await prefs.setString(_raffleLogoFilename, logo.filename!);
      } else {
        await prefs.remove(_raffleLogoFilename);
      }

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error saving raffle logo: $e');
      }
      return false;
    }
  }

  /// Retrieves a RaffleLogo from persistent storage
  Future<RaffleLogo?> getLogo() async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = prefs.getString(_raffleLogo);
    final type = prefs.getString(_raffleLogoType);
    final filename = prefs.getString(_raffleLogoFilename);

    if (base64String == null || base64String.isEmpty) {
      return null;
    }

    try {
      final data = base64Decode(base64String);
      return RaffleLogo(
        data: data,
        type: type ?? 'unknown',
        filename: filename,
      );
    } catch (e) {
      // If decoding fails, remove the corrupted data
      await removeLogo();
      return null;
    }
  }

  /// Removes all raffle logo data from persistent storage
  Future<void> removeLogo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_raffleLogo);
    await prefs.remove(_raffleLogoType);
    await prefs.remove(_raffleLogoFilename);
  }

  /// Checks if a raffle logo is stored
  /// Saves the primary theme color
  Future<void> savePrimaryColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_primaryColor, color.toARGB32());
  }

  /// Retrieves the primary theme color
  Future<Color?> getPrimaryColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt(_primaryColor);
    if (colorValue == null) return null;
    return Color(colorValue);
  }

  /// Saves the theme mode
  Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeMode, mode.name);
  }

  /// Retrieves the theme mode
  Future<ThemeMode?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final modeName = prefs.getString(_themeMode);
    if (modeName == null) return null;
    return ThemeMode.values.firstWhere(
      (m) => m.name == modeName,
      orElse: () => ThemeMode.system,
    );
  }

  /// Saves the blur mode
  Future<void> saveBlurMode(bool hasToBlur) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasToBlur, hasToBlur);
  }

  /// Retrieves the blur mode
  Future<bool?> getBlurMode() async {
    final prefs = await SharedPreferences.getInstance();
    final hasToBlur = prefs.getBool(_hasToBlur);
    return hasToBlur;
  }
}
