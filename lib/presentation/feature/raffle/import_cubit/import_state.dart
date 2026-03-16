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

part of 'import_cubit.dart';

/// Base state for the import flow used by `ImportCubit`.
///
/// Subclasses represent specific points in the import lifecycle
/// (initial, parsing/selecting columns, success, and errors).
abstract class ImportState {
  const ImportState();
}

/// Initial state before any import action has started.
class ImportInitial extends ImportState {
  const ImportInitial() : super();
}

/// State emitted when the imported data has been parsed and the UI
/// must present available columns for the user to choose from.
///
/// The [data] field represents the raw rows of the parsed file where
/// each inner list is a CSV row with dynamic cell values.
class ImportSelectColumn extends ImportState {
  final List<List<dynamic>> data;
  const ImportSelectColumn({required this.data}) : super();
}

/// State emitted when the import process completed successfully.
///
/// Contains the parsed list of participant names extracted from the file.
class ImportSuccess extends ImportState {
  final List<String> participants;
  const ImportSuccess({required this.participants}) : super();
}

/// Base class for import-related errors.
abstract class ImportError extends ImportState {
  const ImportError() : super();
}

/// Error state when the user tried to import but no file was selected.
class ImportErrorNotFileSelected extends ImportError {
  const ImportErrorNotFileSelected() : super();
}

/// Error state when the parsed file does not contain usable columns.
class ImportErrorNotColumnsInFile extends ImportError {
  const ImportErrorNotColumnsInFile() : super();
}

/// Helpful getters and converters for working with `ImportState` instances.
extension ImportStateExtensions on ImportState {
  /// Returns true if the current state is `ImportSuccess`.
  bool get isSuccess => this is ImportSuccess;

  /// Returns true if the current state is `ImportError`.
  bool get isError => this is ImportError;

  /// Returns true if the current state expects the user to select a column.
  bool get hasToSelectColumn => this is ImportSelectColumn;

  /// Returns the participants list when in `ImportSuccess`, otherwise `[]`.
  List<String> get participantsList =>
      isSuccess ? (this as ImportSuccess).participants : [];

  /// Returns the available column names (as strings) when the state is
  /// `ImportSelectColumn`; otherwise returns an empty list.
  List<String> get columnsAvailables => hasToSelectColumn
      ? (this as ImportSelectColumn).data.first
            .map((e) => e.toString())
            .toList()
      : [];

  /// Returns the raw parsed rows when the state is `ImportSelectColumn`.
  List<List<dynamic>> get rawData =>
      hasToSelectColumn ? (this as ImportSelectColumn).data : [];
}
