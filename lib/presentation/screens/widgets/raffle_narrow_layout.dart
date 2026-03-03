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
import 'package:oraffle/presentation/screens/widgets/participant_input_widget.dart';
import 'package:oraffle/presentation/screens/widgets/participant_list_widget.dart';
import 'package:oraffle/presentation/screens/widgets/raffle_controls_widget.dart';

class RaffleNarrowLayout extends StatelessWidget {
  const RaffleNarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.participantListTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const ParticipantInputWidget(),
          const SizedBox(height: 24),
          const RaffleControlsWidget(),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context)!.activeParticipants,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const ParticipantListWidget(),
        ],
      ),
    );
  }
}
