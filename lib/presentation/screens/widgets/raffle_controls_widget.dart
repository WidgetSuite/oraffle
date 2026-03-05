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
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/domain/models/raffle/raffle_session.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_event.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_state.dart';
import 'package:oraffle/presentation/screens/widgets/clear_winners_dialog.dart';
import 'package:oraffle/presentation/screens/widgets/raffle_animation_widget.dart';

class RaffleControlsWidget extends StatelessWidget {
  const RaffleControlsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RaffleBloc, RaffleState>(
      builder: (context, state) {
        RaffleSession? session;
        bool isSelecting = false;

        if (state is RaffleLoaded) {
          session = state.session;
        } else if (state is RaffleWinnerSelected) {
          session = state.session;
        } else if (state is RaffleSelecting) {
          session = state.session;
          isSelecting = true;
        }

        final canStartRaffle =
            session != null && session.canSelectWinner && !isSelecting;

        return Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Animation area
            if (isSelecting) ...[
              const RaffleAnimationWidget(),
              const SizedBox(height: 24),
            ],

            // Start Raffle Button
            FilledButton.icon(
              onPressed: canStartRaffle
                  ? () => _startRaffle(context, session!)
                  : null,
              icon: isSelecting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.casino),
              label: Text(
                isSelecting
                    ? AppLocalizations.of(context)!.raffling
                    : AppLocalizations.of(context)!.startRaffle,
              ),
            ),

            // Status text
            if (session != null) ...[
              Text(
                _getStatusText(session, isSelecting, context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppTheme.zinc500),
              ),
            ],

            // Additional controls
            if (session != null && session.hasWinners) ...[
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => showClearWinnersDialog(context),
                      icon: const Icon(Icons.restart_alt),
                      label: Text(
                        AppLocalizations.of(context)!.resetWinners,
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.errorColor,
                        side: BorderSide(
                          color: AppTheme.errorColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }

  void _startRaffle(BuildContext context, RaffleSession session) {
    final raffleBloc = context.read<RaffleBloc>();

    // Start the selection animation
    raffleBloc.add(StartRaffleSelection());

    // Simulate animation duration and then select winner
    Future.delayed(const Duration(seconds: 3), () {
      final winner = raffleBloc.selectRandomWinner(session.activeParticipants);
      raffleBloc.add(CompleteRaffleSelection(winner));
    });
  }

  String _getStatusText(
    RaffleSession session,
    bool isSelecting,
    BuildContext context,
  ) {
    if (isSelecting) {
      return AppLocalizations.of(context)!.selectingWinner;
    }

    if (session.activeParticipants.isEmpty) {
      if (session.hasParticipants) {
        return AppLocalizations.of(context)!.allParticipantsSelected;
      } else {
        return AppLocalizations.of(context)!.addParticipantsToStart;
      }
    }

    final totalLines = session.participantText
        .split('\n')
        .where((element) => element.trim().isNotEmpty);

    final discardedCount = totalLines.length - session.participants.length;
    if (discardedCount > 0) {
      return '${AppLocalizations.of(context)!.participantsReadyCount(session.activeParticipantsCount)}. ${AppLocalizations.of(context)!.participantDiscarded(discardedCount)}';
    }

    return AppLocalizations.of(
      context,
    )!.participantsReadyCount(session.activeParticipantsCount);
  }
}
