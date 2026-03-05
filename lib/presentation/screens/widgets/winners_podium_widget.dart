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
import 'package:oraffle/domain/models/raffle/raffle_winner.dart';

class WinnersPodiumWidget extends StatelessWidget {
  final List<RaffleWinner> winners;

  const WinnersPodiumWidget({super.key, required this.winners});

  static const _gold = Color(0xFFFFD700);
  static const _silver = Color(0xFFB0BEC5);
  static const _copper = Color(0xFFCD7F32);

  @override
  Widget build(BuildContext context) {
    final first = _winnerAt(1);
    final second = _winnerAt(2);
    final third = _winnerAt(3);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (second != null)
            _PodiumColumn(winner: second, color: _silver, blockHeight: 80, position: 2),
          if (first != null)
            _PodiumColumn(winner: first, color: _gold, blockHeight: 110, position: 1),
          if (third != null)
            _PodiumColumn(winner: third, color: _copper, blockHeight: 60, position: 3),
        ],
      ),
    );
  }

  RaffleWinner? _winnerAt(int position) =>
      winners.where((w) => w.position == position).firstOrNull;
}

class _PodiumColumn extends StatelessWidget {
  final RaffleWinner winner;
  final Color color;
  final double blockHeight;
  final int position;

  const _PodiumColumn({
    required this.winner,
    required this.color,
    required this.blockHeight,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final initial = winner.name.isNotEmpty ? winner.name[0].toUpperCase() : '?';

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.15),
              border: Border.all(color: color, width: 2.5),
            ),
            child: Center(
              child: Text(
                initial,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            winner.name,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Container(
            height: blockHeight,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                '$position',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
