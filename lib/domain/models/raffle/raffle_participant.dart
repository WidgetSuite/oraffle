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

/// Represents a participant in a raffle.
class RaffleParticipant {
  /// The name of the participant.
  final String name;

  /// Whether this participant is still in the raffle (not yet selected).
  final bool isActive;

  /// The probability multiplier for this participant (default: 1).
  /// A participant with weight N has N times the chance of winning compared
  /// to a participant with weight 1.
  final int weight;

  /// Constructor for creating a `RaffleParticipant` instance.
  const RaffleParticipant({
    required this.name,
    this.isActive = true,
    this.weight = 1,
  });

  /// Creates a copy of this participant with optional field overrides.
  RaffleParticipant copyWith({String? name, bool? isActive, int? weight}) {
    return RaffleParticipant(
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      weight: weight ?? this.weight,
    );
  }

  /// Pattern that matches an optional weight suffix: "Name (x5)".
  static final _weightPattern = RegExp(r'^(.*?)\s*\(x(\d+)\)\s*$');

  /// Creates a `RaffleParticipant` from a string.
  ///
  /// Supports an optional weight suffix using the format `Name (xN)`,
  /// e.g. `"Alice (x3)"` creates a participant named "Alice" with weight 3.
  /// Lines without a suffix default to weight 1.
  factory RaffleParticipant.fromString(String line) {
    final trimmed = line.trim();
    final match = _weightPattern.firstMatch(trimmed);
    if (match != null) {
      final parsedName = match.group(1)!.trim();
      final parsedWeight = int.parse(match.group(2)!);
      if (parsedName.isNotEmpty && parsedWeight >= 1) {
        return RaffleParticipant(name: parsedName, weight: parsedWeight);
      }
    }
    return RaffleParticipant(name: trimmed);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RaffleParticipant &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() =>
      'RaffleParticipant(name: $name, isActive: $isActive, weight: $weight)';
}
