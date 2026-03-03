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

class RaffleWideLayout extends StatelessWidget {
  const RaffleWideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Input and controls
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.participantListTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ParticipantInputWidget(),
                  const SizedBox(height: 16),
                  const RaffleControlsWidget(),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(width: 1, color: Colors.grey),
            const SizedBox(width: 16),
            // Right side: Participant list
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppLocalizations.of(context)!.participants,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const ParticipantListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
