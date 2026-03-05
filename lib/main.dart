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
import 'package:oraffle/routes/app_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oraffle/presentation/blocs/locale_cubit/locale_cubit.dart';
import 'package:oraffle/presentation/blocs/locale_cubit/locale_state.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(null);
  runApp(const ORaffleApplication());
}

class ORaffleApplication extends StatefulWidget {
  const ORaffleApplication({super.key});

  @override
  State<ORaffleApplication> createState() => _ORaffleApplicationState();
}

class _ORaffleApplicationState extends State<ORaffleApplication> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(create: (context) => SettingsCubit()),
        BlocProvider(create: (context) => RaffleBloc()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settings) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              return MaterialApp.router(
                routerConfig: goRouter,
                theme: AppTheme.lightTheme(settings.primaryColor),
                darkTheme: AppTheme.darkTheme(settings.primaryColor),
                themeMode: settings.themeMode,
                locale: localeState.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                localeResolutionCallback: (locale, supportedLocales) {
                  if (locale == null) {
                    return supportedLocales.first;
                  }

                  // Check if the current device locale is supported
                  for (final supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale.languageCode &&
                        supportedLocale.countryCode == locale.countryCode) {
                      return supportedLocale;
                    }
                  }

                  // If not supported, check if the language code is supported
                  for (final supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale.languageCode) {
                      return supportedLocale;
                    }
                  }

                  // If the locale is not supported, check if we have a fallback for this language
                  // ignoring country code
                  try {
                    return supportedLocales.firstWhere(
                      (l) => l.languageCode == locale.languageCode,
                      orElse: () => const Locale('en'),
                    );
                  } catch (e) {
                    return const Locale('en');
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
