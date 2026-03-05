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
import 'package:google_fonts/google_fonts.dart';
import 'package:oraffle/core/theme/app_text_theme.dart';
import 'package:oraffle/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:oraffle/core/theme/extensions/custom_colors.dart';

class AppTheme {
  static const Color defaultSeedColor = Color(0xFF8B5CF6);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color errorColor = Color(0xFFEF4444);

  // Zinc palette
  static const Color zinc100 = Color(0xFFF4F4F5);
  static const Color zinc200 = Color(0xFFE4E4E7);
  static const Color zinc300 = Color(0xFFD4D4D8);
  static const Color zinc400 = Color(0xFFA1A1AA);
  static const Color zinc500 = Color(0xFF71717A);
  static const Color zinc600 = Color(0xFF52525B);
  static const Color zinc700 = Color(0xFF3F3F46);
  static const Color zinc800 = Color(0xFF27272A);
  static const Color zinc900 = Color(0xFF18181B);

  // Semantic aliases kept for external references
  static const Color primaryColor = defaultSeedColor;
  static const Color backgroundColor = Colors.white;
  static const Color cardColorLight = zinc100;
  static const Color surfaceColor = Colors.white;
  static const Color textColor = zinc900;
  static const Color textSecondaryColor = zinc500;
  static const Color borderColor = zinc200;
  static const Color cardColorDark = zinc800;
  static const Color borderColorDark = zinc700;
  static const Color zinc50 = Color(0xFFFAFAFA);
  static const Color shadowColor = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color violet100 = Color(0xFFEDE9FE);
  static const Color violet400 = Color(0xFFA78BFA);
  static const Color violet500 = defaultSeedColor;
  static const Color violet900 = Color(0xFF4C1D95);

  static ThemeData lightTheme([Color seed = defaultSeedColor]) {
    final colorScheme = ColorScheme.fromSeed(seedColor: seed).copyWith(
      primary: seed,
      secondary: secondaryColor,
      surface: Colors.white,
      onSecondary: Colors.black,
      onSurface: textColor,
      error: errorColor,
      onError: Colors.white,
    );
    return _buildTheme(colorScheme);
  }

  static ThemeData darkTheme([Color seed = defaultSeedColor]) {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.dark,
        ).copyWith(
          primary: seed,
          secondary: secondaryColor,
          surface: zinc900,
          onSecondary: Colors.black,
          onSurface: const Color(0xFFFAFAFA),
          error: errorColor,
          onError: Colors.white,
        );
    return _buildTheme(colorScheme);
  }

  static ThemeData _buildTheme(ColorScheme colorScheme) {
    final isDark = colorScheme.brightness == Brightness.dark;

    const buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
    const buttonSize = Size(0, 56);

    final dialogColors = isDark
        ? const ConfirmingDialogColorsExtension(
            card: cardColorDark,
            title: Colors.white,
            subtitle: zinc400,
            surface: borderColorDark,
            border: borderColorDark,
          )
        : const ConfirmingDialogColorsExtension(
            card: Colors.white,
            title: textColor,
            subtitle: textSecondaryColor,
            surface: cardColorLight,
            border: borderColor,
          );

    final customColors = isDark
        ? const CustomColors(
            aiIconColor: defaultSeedColor,
            success: Color(0xFF10B981),
            info: Color(0xFF3B82F6),
            warning: Color(0xFFFBBF24),
            warningContainer: Color(0xFF3D2000),
            onWarningContainer: Color(0xFFF59E0B),
            successContainer: Color(0xFF1B4332),
            onSuccessContainer: Color(0xFF4ADE80),
            winnersContainer: Color(0xFF3D1A00),
            onWinnersContainer: Color(0xFFFB923C),
          )
        : const CustomColors(
            aiIconColor: defaultSeedColor,
            success: Color(0xFF10B981),
            info: Color(0xFF3B82F6),
            warning: Color(0xFFFBBF24),
            warningContainer: Color(0xFFFEF3C7),
            onWarningContainer: Color(0xFFD97706),
            successContainer: Color(0xFFDCFCE7),
            onSuccessContainer: Color(0xFF166534),
            winnersContainer: Color(0xFFFFF7ED),
            onWinnersContainer: Color(0xFFC2410C),
          );

    return ThemeData(
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      cardColor: isDark ? cardColorDark : cardColorLight,
      dividerColor: isDark ? borderColorDark : borderColor,
      hintColor: zinc400,
      textTheme: AppTextTheme.textTheme,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        titleTextStyle: GoogleFonts.plusJakartaSans(
          color: colorScheme.onPrimary,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(buttonSize),
          shape: WidgetStatePropertyAll(buttonShape),
          iconSize: WidgetStatePropertyAll(20),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(buttonSize),
          shape: WidgetStatePropertyAll(buttonShape),
          iconSize: WidgetStatePropertyAll(20),
          shadowColor: WidgetStateColor.resolveWith(
            (state) => state.contains(WidgetState.disabled)
                ? Colors.transparent
                : Colors.black,
          ),
          elevation: WidgetStatePropertyAll(1),
        ),
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(buttonSize),
          shape: WidgetStatePropertyAll(buttonShape),
          iconSize: WidgetStatePropertyAll(20),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: zinc400),
      ),
      extensions: [dialogColors, customColors],
    );
  }
}
