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
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/domain/models/raffle/raffle_session.dart';
import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/core/theme/extensions/confirm_dialog_colors_extension.dart';

class WinnerDialog extends StatelessWidget {
  final String winnerName;
  final RaffleSession session;
  final VoidCallback onRepeatRaffle;
  final VoidCallback onFinishRaffle;

  const WinnerDialog({
    super.key,
    required this.winnerName,
    required this.session,
    required this.onRepeatRaffle,
    required this.onFinishRaffle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;

    // Design Tokens
    final titleColor = Theme.of(context).colorScheme.onSurface;
    final trophyBg = isDark
        ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)
        : Theme.of(context).colorScheme.primary.withValues(alpha: 0.1);
    final trophyIcon = Theme.of(context).colorScheme.primary;
    final nameBg = isDark ? AppTheme.zinc700 : AppTheme.zinc100;
    final nameText = isDark ? AppTheme.backgroundColor : AppTheme.zinc900;
    final statsBg = isDark ? AppTheme.zinc900 : AppTheme.zinc50;
    final statsLabel = Theme.of(context).colorScheme.onSurface;

    final tt = Theme.of(context).textTheme;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Trophy icon
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: trophyBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.emoji_events, size: 48, color: trophyIcon),
              ),
            ),

            const SizedBox(height: 24),

            // Winner announcement
            Text(
              AppLocalizations.of(context)!.congratulations,
              style: tt.headlineSmall!.copyWith(color: titleColor),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Winner name
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: nameBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                winnerName,
                style: tt.titleLarge!.copyWith(color: nameText),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            // Statistics
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: statsBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.positionLabel(session.winnersCount + 1),
                    style: tt.labelLarge!.copyWith(color: statsLabel),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalizations.of(context)!.remainingParticipants(
                      session.activeParticipantsCount - 1,
                    ),
                    style: tt.bodyMedium!.copyWith(color: colors.subtitle),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Action buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Continue raffle button
                if (session.activeParticipantsCount > 1) ...[
                  FilledButton.icon(
                    onPressed: onRepeatRaffle,

                    icon: const Icon(Icons.casino, size: 20),
                    label: Text(AppLocalizations.of(context)!.continueRaffle),
                  ),
                  const SizedBox(height: 12),
                ],

                // Finish raffle / View Winners button
                session.activeParticipantsCount > 1
                    ? OutlinedButton.icon(
                        onPressed: onFinishRaffle,
                        icon: Icon(Icons.emoji_events),
                        label: Text(AppLocalizations.of(context)!.winnersTitle),
                      )
                    : ElevatedButton.icon(
                        onPressed: onFinishRaffle,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                        ),
                        icon: const Icon(Icons.emoji_events),
                        label: Text(AppLocalizations.of(context)!.finishRaffle),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
