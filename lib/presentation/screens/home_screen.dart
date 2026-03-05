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
import 'package:go_router/go_router.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:oraffle/presentation/screens/widgets/logo_widget.dart';
import 'package:oraffle/routes/app_router.dart';
import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/presentation/screens/settings_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _showSettingsDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const SettingsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settings) {
          final logo = settings.companyLogo;

          return SafeArea(
            child: Stack(
              children: [
                // Settings button top right
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => _showSettingsDialog(context),
                    tooltip: AppLocalizations.of(context)!.settingsTitle,
                  ),
                ),

                // Main content
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo Section
                        if (logo != null)
                          Container(
                            height: 180,
                            constraints: const BoxConstraints(maxWidth: 320),
                            child: LogoWidget(
                              logo: logo,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(
                                    Icons.broken_image,
                                    size: 80,
                                    color: Theme.of(context).hintColor,
                                  ),
                            ),
                          )
                        else
                          GestureDetector(
                            onTap: () => _showSettingsDialog(context),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 80,
                                  color: Theme.of(context).hintColor,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  AppLocalizations.of(context)!.addCompanyLogo,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.zinc400),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 48),

                        // Title
                        Text(
                          AppLocalizations.of(context)!.appTitle,
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),

                      

                        // Subtitle
                        Text(
                          AppLocalizations.of(context)!.homeSubtitle,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppTheme.zinc500),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 64),

                        // Start Raffle Button
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: FilledButton(
                              onPressed: () => context.go(AppRoutes.raffle),
                              child: Text(
                                AppLocalizations.of(context)!.startRaffle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
