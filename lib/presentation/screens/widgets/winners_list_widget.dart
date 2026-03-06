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
import 'package:go_router/go_router.dart';
import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/domain/models/raffle/raffle_winner.dart';
import 'package:oraffle/presentation/screens/widgets/clear_winners_dialog.dart';
import 'package:oraffle/presentation/screens/widgets/reset_raffle_dialog.dart';
import 'package:oraffle/presentation/screens/widgets/winner_card_widget.dart';
import 'package:oraffle/presentation/screens/widgets/winners_podium_widget.dart';
import 'package:oraffle/routes/app_router.dart';

class WinnersListWidget extends StatelessWidget {
  final List<RaffleWinner> winners;

  const WinnersListWidget({super.key, required this.winners});

  @override
  Widget build(BuildContext context) {
    final podiumWinners = winners.where((w) => w.position <= 3).toList();

    return Column(
      children: [
        // Header
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            spacing: 16,
            children: [
              // Title
              Text(
                AppLocalizations.of(context)!.raffleCompleted,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              // Subtitle with divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      AppLocalizations.of(
                        context,
                      )!.winnersSelectedCount(winners.length),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: AppTheme.zinc500),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
            ],
          ),
        ),

        // Podium for top 3
        if (podiumWinners.isNotEmpty) ...[
          WinnersPodiumWidget(winners: podiumWinners),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 0.5,),
          ),
        ],

        // Remaining winners (4th place and beyond)
        if (winners.isNotEmpty)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              itemCount: winners.length,
              itemBuilder: (context, index) {
                final winner = winners[index];
                return WinnerCardWidget(winner: winner, index: index);
              },
            ),
          )
        else
          const Spacer(),

        // Footer with action buttons
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () async {
                    final confirmed = await showResetRaffleDialog(context);
                    if (confirmed && context.mounted) {
                      context.go(AppRoutes.raffle);
                    }
                  },
                  icon: const Icon(Icons.repeat),
                  label: Text(AppLocalizations.of(context)!.newRaffle),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final confirmed = await showClearWinnersDialog(context);
                    if (confirmed && context.mounted) {
                      context.go(AppRoutes.raffle);
                    }
                  },
                  icon: const Icon(Icons.restart_alt),
                  label: Text(AppLocalizations.of(context)!.resetWinners),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
