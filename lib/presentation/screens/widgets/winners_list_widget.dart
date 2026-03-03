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
import 'package:oraffle/routes/app_router.dart';

class WinnersListWidget extends StatelessWidget {
  final List<RaffleWinner> winners;

  const WinnersListWidget({super.key, required this.winners});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with summary
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            children: [
              // Crown icon at the top
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.amber[300]!, Colors.orange[400]!],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                AppLocalizations.of(context)!.raffleCompleted,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // Subtitle with divider
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1, color: AppTheme.zinc300),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      AppLocalizations.of(
                        context,
                      )!.winnersSelectedCount(winners.length),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.zinc500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(height: 1, color: AppTheme.zinc300),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Winners list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: winners.length,
            itemBuilder: (context, index) {
              final winner = winners[index];
              return WinnerCardWidget(winner: winner, index: index);
            },
          ),
        ),

        // Footer with action buttons
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final confirmed = await showResetRaffleDialog(context);
                    if (confirmed && context.mounted) {
                      context.go(AppRoutes.raffle);
                    }
                  },
                  icon: const Icon(Icons.refresh),
                  label: Text(
                    AppLocalizations.of(context)!.newRaffle,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final confirmed = await showClearWinnersDialog(context);
                    if (confirmed && context.mounted) {
                      context.go(AppRoutes.raffle);
                    }
                  },
                  icon: const Icon(Icons.restart_alt),
                  label: Text(
                    AppLocalizations.of(context)!.resetWinners,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.errorColor,
                    side: BorderSide(
                      color: AppTheme.errorColor.withValues(alpha: 0.3),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
