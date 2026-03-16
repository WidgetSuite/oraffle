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

import 'package:oraffle/domain/models/raffle/raffle_session.dart';

/// Abstract class representing the base state for raffle operations.
abstract class RaffleState {}

/// The initial state of the raffle.
class RaffleInitial extends RaffleState {}

/// State representing the current raffle session.
class RaffleLoaded extends RaffleState {
  final RaffleSession session;

  RaffleLoaded(this.session);
}

/// State representing that the raffle selection animation is in progress.
class RaffleSelecting extends RaffleState {
  final RaffleSession session;

  RaffleSelecting(this.session);
}

/// State representing that a winner has been selected.
class RaffleWinnerSelected extends RaffleState {
  final RaffleSession session;
  final String selectedWinner;

  RaffleWinnerSelected(this.session, this.selectedWinner);
}

/// State representing an error in the raffle process.
class RaffleError extends RaffleState {
  final String message;

  RaffleError(this.message);
}

/// State representing a warning message that should be shown to the user.
class RaffleWarning extends RaffleState {
  final RaffleSession session;
  final String message;

  RaffleWarning(this.session, this.message);
}

extension RaffleStateX on RaffleState {
  RaffleSession get getSession => (this as RaffleLoaded).session;
}
