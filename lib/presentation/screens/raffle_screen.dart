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
import 'package:oraffle/presentation/screens/settings_dialog.dart';
import 'package:oraffle/presentation/screens/widgets/logo_widget.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/core/theme/extensions/custom_colors.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_event.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_state.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:oraffle/presentation/screens/widgets/raffle_narrow_layout.dart';
import 'package:oraffle/presentation/screens/widgets/raffle_wide_layout.dart';
import 'package:oraffle/presentation/screens/widgets/winner_dialog.dart';
import 'package:oraffle/routes/app_router.dart';

class RaffleScreen extends StatelessWidget {
  const RaffleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _RaffleScreenContent();
  }
}

class _RaffleScreenContent extends StatelessWidget {
  const _RaffleScreenContent();

  Future<void> _showSettingsDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const SettingsDialog(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settings) {
        final logo = settings.companyLogo;

        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: logo != null
                  ? Container(
                      height: 40,
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: LogoWidget(
                        logo: logo,
                        height: 40,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint('AppBar logo failed to load: $error');
                          return Text(
                            AppLocalizations.of(context)!.raffleTitle,
                          );
                        },
                        loadingBuilder: (context) => const SizedBox(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(AppLocalizations.of(context)!.raffleTitle),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go(AppRoutes.home),
            ),
            actions: [
              IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => _showSettingsDialog(context),
                    tooltip: AppLocalizations.of(context)!.settingsTitle,
                  ),
              SizedBox(width: 16,),
              // Winners history button
              BlocBuilder<RaffleBloc, RaffleState>(
                builder: (context, state) {
                  bool hasWinners = false;
                  if (state is RaffleLoaded) {
                    hasWinners = state.session.hasWinners;
                  } else if (state is RaffleWinnerSelected) {
                    hasWinners = state.session.hasWinners;
                  } else if (state is RaffleWarning) {
                    hasWinners = state.session.hasWinners;
                  }

                  return FilledButton.icon(
                    onPressed: hasWinners
                        ? () => context.go(AppRoutes.raffleWinners)
                        : null,
                    icon: Icon(
                      Icons.emoji_events,
                      color: hasWinners
                          ? null
                          : AppTheme.zinc500,
                    ),
                    style: FilledButton.styleFrom(
                      elevation: 2,
                      minimumSize: Size(0, 48),
                    ),
                    label: Text(AppLocalizations.of(context)!.winnersTitle),
                  );
                },
              ),
              SizedBox(width: 16,),
            ],
          ),
          body: BlocListener<RaffleBloc, RaffleState>(
            listener: (context, state) {
              if (state is RaffleWinnerSelected) {
                _showWinnerDialog(context, state.selectedWinner, state.session);
              } else if (state is RaffleError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppTheme.errorColor,
                  ),
                );
              } else if (state is RaffleWarning) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Theme.of(
                      context,
                    ).extension<CustomColors>()!.onWarningContainer,
                    duration: const Duration(seconds: 5),
                    action: SnackBarAction(
                      label: AppLocalizations.of(context)!.okButton,
                      textColor: Colors.white,
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
                // Return to loaded state after showing warning
                context.read<RaffleBloc>().add(DismissWarning());
              }
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Responsive layout: single column on mobile, two columns on larger screens
                final isWideScreen = constraints.maxWidth > 800;

                if (isWideScreen) {
                  return const RaffleWideLayout();
                } else {
                  return const RaffleNarrowLayout();
                }
              },
            ),
          ),
        );
      },
    );
  }

  void _showWinnerDialog(BuildContext context, String winner, dynamic session) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => WinnerDialog(
        winnerName: winner,
        session: session,
        onRepeatRaffle: () {
          Navigator.of(dialogContext).pop();
          context.read<RaffleBloc>().add(ConfirmWinner(winner));
        },
        onFinishRaffle: () {
          Navigator.of(dialogContext).pop();
          context.read<RaffleBloc>().add(ConfirmWinner(winner));
          context.go(AppRoutes.raffleWinners);
        },
      ),
    );
  }
}
