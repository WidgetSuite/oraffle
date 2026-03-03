// Copyright (C) 2026 Víctor Carreras
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
import 'package:oraffle/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:oraffle/core/theme/extensions/custom_colors.dart';

class AppTheme {
  // Define main application colors
  static const Color primaryColor = Color(0xFF8B5CF6);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Colors.white;
  static const Color cardColorLight = Color(0xFFF4F4F5); // Zinc 100
  static const Color surfaceColor = Colors.white;
  static const Color errorColor = Color(0xFFEF4444); // Lucide red
  static const Color textColor = Color(0xFF18181B); // Zinc 900
  static const Color textSecondaryColor = Color(0xFF71717A); // Zinc 500
  static const Color borderColor = Color(0xFFE4E4E7); // Zinc 200
  static const Color cardColorDark = Color(0xFF27272A); // Zinc 800
  static const Color borderColorDark = Color(0xFF3F3F46); // Zinc 700
  static const Color zinc50 = Color(0xFFFAFAFA);
  static const Color zinc100 = Color(0xFFF4F4F5); // cardColorLight
  static const Color zinc200 = Color(0xFFE4E4E7); // borderColor
  static const Color zinc300 = Color(0xFFD4D4D8);
  static const Color zinc400 = Color(0xFFA1A1AA);
  static const Color zinc500 = Color(0xFF71717A); // textSecondaryColor
  static const Color zinc600 = Color(0xFF52525B);
  static const Color zinc700 = Color(0xFF3F3F46); // borderColorDark
  static const Color zinc800 = Color(0xFF27272A); // cardColorDark
  static const Color zinc900 = Color(0xFF18181B); // textColor

  static const Color violet100 = Color(0xFFEDE9FE);
  static const Color violet400 = Color(0xFFA78BFA);
  static const Color violet500 = Color(0xFF8B5CF6); // primaryColor
  static const Color violet900 = Color(0xFF4C1D95);

  static const Color shadowColor = Colors.black;
  static const Color transparent = Colors.transparent;

  static ThemeData get lightTheme => ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColorLight,
    dividerColor: borderColor,
    hintColor: zinc400,
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: textColor,
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: surfaceColor,
      foregroundColor: textColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.plusJakartaSans(
        color: textColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: textColor),
    ),
    extensions: [
      const ConfirmingDialogColorsExtension(
        card: Colors.white,
        title: textColor,
        subtitle: textSecondaryColor,
        surface: cardColorLight,
        border: borderColor,
      ),
      const CustomColors(
        aiIconColor: primaryColor,
        success: Color(0xFF10B981),
        info: Color(0xFF3B82F6),
        warning: Color(0xFFFBBF24),
        warningContainer: Color(0xFFFEF3C7),
        onWarningContainer: Color(0xFFD97706),
      ),
    ],
  );

  static ThemeData get darkTheme => ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF18181B),
    cardColor: cardColorDark,
    dividerColor: borderColorDark,
    hintColor: zinc400,
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Color(0xFF18181B),
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Color(0xFFFAFAFA),
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF18181B),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.plusJakartaSans(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    extensions: [
      const ConfirmingDialogColorsExtension(
        card: cardColorDark,
        title: Colors.white,
        subtitle: zinc400,
        surface: borderColorDark,
        border: borderColorDark,
      ),
      CustomColors(
        aiIconColor: primaryColor,
        success: const Color(0xFF10B981),
        info: const Color(0xFF3B82F6),
        warning: const Color(0xFFFBBF24),
        warningContainer: const Color(0xFFF59E0B).withValues(alpha: 0.2),
        onWarningContainer: const Color(0xFFF59E0B),
      ),
    ],
  );
}
