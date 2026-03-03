// Copyright (C) 2026 Víctor Carreras
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
import 'package:oraffle/domain/models/raffle/raffle_winner.dart';

class WinnerCardWidget extends StatelessWidget {
  final RaffleWinner winner;
  final int index;

  const WinnerCardWidget({
    super.key,
    required this.winner,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final position = winner.position;
    Color cardColor;
    IconData icon;
    Color iconColor;

    switch (position) {
      case 1:
        cardColor = Colors.amber[50]!;
        icon = Icons.looks_one;
        iconColor = Colors.amber;
        break;
      case 2:
        cardColor = Colors.grey[100]!;
        icon = Icons.looks_two;
        iconColor = Colors.grey[600]!;
        break;
      case 3:
        cardColor = Colors.orange[50]!;
        icon = Icons.looks_3;
        iconColor = Colors.orange;
        break;
      default:
        cardColor = Colors.blue[50]!;
        icon = Icons.emoji_events;
        iconColor = Colors.blue;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: cardColor,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: iconColor.withValues(alpha: 0.2),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        title: Text(
          winner.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          '${AppLocalizations.of(context)!.placeLabel(_getPositionText(context, position))} • ${_formatTime(winner.selectedAt)}',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        trailing: position <= 3
            ? Icon(Icons.emoji_events, color: iconColor, size: 28)
            : null,
      ),
    );
  }

  String _getPositionText(BuildContext context, int position) {
    switch (position) {
      case 1:
        return AppLocalizations.of(context)!.firstPlace;
      case 2:
        return AppLocalizations.of(context)!.secondPlace;
      case 3:
        return AppLocalizations.of(context)!.thirdPlace;
      default:
        return AppLocalizations.of(context)!.nthPlace(position);
    }
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
