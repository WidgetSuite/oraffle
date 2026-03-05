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
import 'package:oraffle/core/theme/extensions/custom_colors.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_state.dart';
import 'package:oraffle/domain/models/raffle/raffle_session.dart';

enum _StatVariant { total, active, winners }

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.value,
    required this.label,
    required this.variant,
  });

  final int value;
  final String label;
  final _StatVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final custom = theme.extension<CustomColors>()!;

    final (bg, fg) = switch (variant) {
      _StatVariant.total => (theme.cardColor, theme.colorScheme.onSurface),
      _StatVariant.active => (custom.successContainer!, custom.onSuccessContainer!),
      _StatVariant.winners => (custom.winnersContainer!, custom.onWinnersContainer!),
    };

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style: theme.textTheme.titleLarge!.copyWith(color: fg),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.labelSmall!.copyWith(
              color: fg.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class ParticipantListWidget extends StatelessWidget {
  const ParticipantListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RaffleBloc, RaffleState>(
      builder: (context, state) {
        RaffleSession? session;

        if (state is RaffleLoaded) {
          session = state.session;
        } else if (state is RaffleWinnerSelected) {
          session = state.session;
        } else if (state is RaffleSelecting) {
          session = state.session;
        }

        if (session == null || !session.hasParticipants) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.people_outline, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.noParticipants,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.addParticipantsHint,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          );
        }

        final activeParticipants = session.activeParticipants;
        final inactiveParticipants = session.participants
            .where((p) => !p.isActive)
            .toList();

        final l10n = AppLocalizations.of(context)!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Summary
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    value: session.totalParticipants,
                    label: l10n.statLabelTotal,
                    variant: _StatVariant.total,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatCard(
                    value: activeParticipants.length,
                    label: l10n.statLabelActive,
                    variant: _StatVariant.active,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _StatCard(
                    value: session.winnersCount,
                    label: l10n.statLabelWinners,
                    variant: _StatVariant.winners,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Participants list
            if (activeParticipants.isNotEmpty) ...[
              Text(
                AppLocalizations.of(context)!.activeParticipants,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).extension<CustomColors>()!.onSuccessContainer,
                ),
              ),
              const SizedBox(height: 8),
              ...activeParticipants.map(
                (participant) => Card(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: ListTile(
                    dense: true,
                    leading: const Icon(Icons.person, color: Colors.green),
                    title: Text(participant.name),
                    trailing: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],

            if (inactiveParticipants.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.alreadySelected,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).extension<CustomColors>()!.onWinnersContainer,
                ),
              ),
              const SizedBox(height: 8),
              ...inactiveParticipants.map(
                (participant) => Card(
                  margin: const EdgeInsets.only(bottom: 4),
                  color: Colors.grey[100],
                  child: ListTile(
                    dense: true,
                    leading: const Icon(Icons.person_off, color: Colors.grey),
                    title: Text(
                      participant.name,
                      style: const TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.emoji_events,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
