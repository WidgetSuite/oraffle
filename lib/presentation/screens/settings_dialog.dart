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

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:oraffle/domain/models/raffle/raffle_logo.dart';
import 'package:oraffle/presentation/blocs/locale_cubit/locale_cubit.dart';
import 'package:oraffle/presentation/blocs/locale_cubit/locale_state.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:oraffle/presentation/screens/widgets/logo_widget.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(
      context,
    ).extension<ConfirmingDialogColorsExtension>()!;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: 520,
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.border, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.settingsTitle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colors.title,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: IconButton.styleFrom(
                          backgroundColor: colors.surface,
                          fixedSize: const Size(40, 40),
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                        ),
                        icon: Icon(
                          LucideIcons.x,
                          size: 20,
                          color: colors.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Branding Section
                        _SectionTitle(
                          title: AppLocalizations.of(context)!.logoPreview,
                        ),
                        const SizedBox(height: 16),
                        _LogoSetting(logo: state.companyLogo),

                        const SizedBox(height: 32),

                        // Theme Section
                        _SectionTitle(
                          title: AppLocalizations.of(context)!.themeColor,
                        ),
                        const SizedBox(height: 16),
                        _ColorSetting(selectedColor: state.primaryColor),

                        const SizedBox(height: 32),
                        _SectionTitle(
                          title: AppLocalizations.of(context)!.themeModeLabel,
                        ),
                        const SizedBox(height: 16),
                        _ThemeModeSetting(selectedMode: state.themeMode),

                        const SizedBox(height: 32),
                        if (kDebugMode) ...[
                          _SectionTitle(title: "Language"),
                          const SizedBox(height: 16),
                          _LanguageSetting(),
                        ],
                      ],
                    ),
                  ),
                ),

                // Save/Close Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.okButton),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}

class _LogoSetting extends StatelessWidget {
  final RaffleLogo? logo;
  const _LogoSetting({this.logo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (logo != null)
          Stack(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                ),
                padding: const EdgeInsets.all(16),
                child: LogoWidget(logo: logo!, fit: BoxFit.contain),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () =>
                      context.read<SettingsCubit>().updateLogo(null),
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                ),
              ),
            ],
          )
        else
          InkWell(
            onTap: () => _pickLogo(context),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey.withValues(alpha: 0.2),
                  style: BorderStyle.solid,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Click to pick a logo",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _pickLogo(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      if (file.bytes != null && context.mounted) {
        final newLogo = RaffleLogo.fromFile(file.bytes!, file.name);
        context.read<SettingsCubit>().updateLogo(newLogo);
      }
    }
  }
}

class _ColorSetting extends StatefulWidget {
  final Color selectedColor;
  const _ColorSetting({required this.selectedColor});

  @override
  State<_ColorSetting> createState() => _ColorSettingState();
}

class _ColorSettingState extends State<_ColorSetting> {
  late TextEditingController _controller;
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    final hexCode = _colorToHex(widget.selectedColor);
    _controller = TextEditingController(text: hexCode);
  }

  @override
  void didUpdateWidget(_ColorSetting oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedColor != widget.selectedColor) {
      final hexCode = _colorToHex(widget.selectedColor);
      if (_controller.text.toUpperCase() != hexCode) {
        _controller.text = hexCode;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  Color? _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    if (hex.length != 8) return null;
    try {
      return Color(int.parse(hex, radix: 16));
    } catch (_) {
      return null;
    }
  }

  void _onChanged(String value) {
    final color = _hexToColor(value);
    setState(() {
      _isValid = color != null;
    });

    if (color != null) {
      context.read<SettingsCubit>().updatePrimaryColor(color);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(
      context,
    ).extension<ConfirmingDialogColorsExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Color Preview
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: widget.selectedColor,
                shape: BoxShape.circle,
                border: Border.all(color: colors.border, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: widget.selectedColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.colorize, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            // Hex Input
            Expanded(
              child: TextField(
                controller: _controller,
                onChanged: _onChanged,
                decoration: InputDecoration(
                  hintText: '#RRGGBB',
                  errorText: _isValid
                      ? null
                      : AppLocalizations.of(context)!.invalidHexColor,
                  prefixIcon: const Icon(Icons.tag, size: 18),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: colors.card.withValues(alpha: 0.5),
                ),
                style: const TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ThemeModeSetting extends StatelessWidget {
  final ThemeMode selectedMode;
  const _ThemeModeSetting({required this.selectedMode});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildModeOption(
          context,
          ThemeMode.system,
          Icons.brightness_auto,
          AppLocalizations.of(context)!.systemTheme,
        ),
        const SizedBox(width: 12),
        _buildModeOption(
          context,
          ThemeMode.light,
          Icons.light_mode,
          AppLocalizations.of(context)!.lightTheme,
        ),
        const SizedBox(width: 12),
        _buildModeOption(
          context,
          ThemeMode.dark,
          Icons.dark_mode,
          AppLocalizations.of(context)!.darkTheme,
        ),
      ],
    );
  }

  Widget _buildModeOption(
    BuildContext context,
    ThemeMode mode,
    IconData icon,
    String label,
  ) {
    final isSelected = selectedMode == mode;
    return Expanded(
      child: InkWell(
        onTap: () => context.read<SettingsCubit>().updateThemeMode(mode),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Colors.grey.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              value: state.locale ?? const Locale('en'),
              isExpanded: true,
              items: AppLocalizations.supportedLocales.map((locale) {
                return DropdownMenuItem(
                  value: locale,
                  child: Text(_getLanguageName(locale)),
                );
              }).toList(),
              onChanged: (locale) {
                if (locale != null) {
                  context.read<LocaleCubit>().changeLocale(locale);
                }
              },
            ),
          ),
        );
      },
    );
  }

  String _getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'de':
        return 'Deutsch';
      case 'it':
        return 'Italiano';
      case 'pt':
        return 'Português';
      case 'ja':
        return '日本語';
      case 'ar':
        return 'العربية';
      case 'ca':
        return 'Català';
      case 'gl':
        return 'Galego';
      case 'eu':
        return 'Euskara';
      case 'el':
        return 'Ελληνικά';
      case 'hi':
        return 'हिन्दी';
      default:
        return locale.languageCode;
    }
  }
}
