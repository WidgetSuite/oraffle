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

import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:oraffle/domain/models/raffle/raffle_session.dart';

class WinnerDialog extends StatefulWidget {
  final List<String> winnersName;
  final RaffleSession session;
  final VoidCallback onRepeatRaffle;
  final VoidCallback onFinishRaffle;
  final bool confettiEnabled;

  const WinnerDialog({
    super.key,
    required this.winnersName,
    required this.session,
    required this.onRepeatRaffle,
    required this.onFinishRaffle,
    this.confettiEnabled = true,
  });

  @override
  State<WinnerDialog> createState() => _WinnerDialogState();
}

class _WinnerDialogState extends State<WinnerDialog> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    if (widget.confettiEnabled) {
      _confettiController.play();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;

    // Design Tokens
    final titleColor = Theme.of(context).colorScheme.onSurface;
    final trophyBg = Theme.of(
      context,
    ).colorScheme.onPrimary.withValues(alpha: 0.2);
    final trophyIcon = Theme.of(context).colorScheme.primary;
    final nameBg = isDark ? AppTheme.zinc700 : AppTheme.zinc100;
    final nameText = isDark ? AppTheme.backgroundColor : AppTheme.zinc900;
    final statsBg = isDark ? AppTheme.zinc900 : AppTheme.zinc50;
    final statsLabel = Theme.of(context).colorScheme.onSurface;

    final tt = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
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
                      border: BoxBorder.all(color: trophyIcon, width: 2),
                    ),
                    child: Icon(
                      Icons.emoji_events,
                      size: 48,
                      color: trophyIcon,
                    ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: nameBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.winnersName
                        .map(
                          (winner) => Text(
                            winner,
                            style: tt.titleLarge!.copyWith(color: nameText),
                            textAlign: TextAlign.center,
                          ),
                        )
                        .toList(),
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
                        )!.positionLabel(widget.session.winnersCount + 1),
                        style: tt.labelLarge!.copyWith(color: statsLabel),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        AppLocalizations.of(context)!.remainingParticipants(
                          widget.session.activeParticipantsCount - 1,
                        ),
                        style: tt.bodyMedium!.copyWith(
                          color: colors.subtitle,
                        ),
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
                    if (widget.session.activeParticipantsCount > 1) ...[
                      FilledButton.icon(
                        onPressed: widget.onRepeatRaffle,
                        icon: const Icon(Icons.casino, size: 20),
                        label: Text(
                          AppLocalizations.of(context)!.continueRaffle,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],

                    // Finish raffle / View Winners button
                    widget.session.activeParticipantsCount > 1
                        ? OutlinedButton.icon(
                            onPressed: widget.onFinishRaffle,
                            icon: Icon(Icons.emoji_events),
                            label: Text(
                              AppLocalizations.of(context)!.winnersTitle,
                            ),
                          )
                        : FilledButton.icon(
                            onPressed: widget.onFinishRaffle,
                            icon: const Icon(Icons.emoji_events),
                            label: Text(
                              AppLocalizations.of(context)!.finishRaffle,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),

          // Confetti cannon positioned at the top-center of the dialog
          if (widget.confettiEnabled)
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: pi / 2,
              numberOfParticles: 30,
              gravity: 0.2,
              emissionFrequency: 0.05,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.purple,
                Colors.orange,
                Colors.pink,
              ],
            ),
        ],
      ),
    );
  }
}
