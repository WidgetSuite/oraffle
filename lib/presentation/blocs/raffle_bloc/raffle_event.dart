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

import 'dart:typed_data';

/// Abstract class representing the base event for raffle operations.
abstract class RaffleEvent {}

/// Event to update the participant list from text input.
class UpdateParticipantText extends RaffleEvent {
  final String text;
  UpdateParticipantText(this.text);
}

/// Event to start the raffle selection process.
class StartRaffleSelection extends RaffleEvent {}

/// Event to complete the raffle selection with a winner.
class CompleteRaffleSelection extends RaffleEvent {
  final String winnerName;
  CompleteRaffleSelection(this.winnerName);
}

/// Event to remove a winner from the participants and add to winners list.
class ConfirmWinner extends RaffleEvent {
  final String winnerName;
  ConfirmWinner(this.winnerName);
}

/// Event to reset the entire raffle session.
class ResetRaffle extends RaffleEvent {}

/// Event to clear all participants.
class ClearParticipants extends RaffleEvent {}

/// Event to clear all winners.
class ClearWinners extends RaffleEvent {}

/// Event to set a custom logo for the raffle.
class SetRaffleLogo extends RaffleEvent {
  final Uint8List logoBytes;
  final String? filename;

  SetRaffleLogo(this.logoBytes, {this.filename});
}

/// Event to remove the custom logo from the raffle.
class RemoveRaffleLogo extends RaffleEvent {}

/// Event to load the persisted logo from storage.
class LoadPersistedLogo extends RaffleEvent {}

/// Event to show a warning message to the user.
class ShowWarning extends RaffleEvent {
  final String message;
  ShowWarning(this.message);
}

/// Event to dismiss a warning and return to normal loaded state.
class DismissWarning extends RaffleEvent {}
