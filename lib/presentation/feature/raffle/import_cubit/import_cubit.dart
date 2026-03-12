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

import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oraffle/core/utils/import_utils.dart';

part 'import_state.dart';

class ImportCubit extends Cubit<ImportState> {
  /// Creates an [ImportCubit] with the initial import state.
  ImportCubit() : super(ImportInitial());

  /// Triggered when the user presses the import button.
  ///
  /// Opens a file picker restricted to the extensions configured by
  /// `ImportUtils.extensionsAllowed`, parses the selected CSV file and
  /// emits one of the following states:
  /// - `ImportErrorNotFileSelected` when the user cancels the picker.
  /// - `ImportSelectColumn` when multiple columns are present and the
  ///   UI must allow the user to pick which column contains participants.
  /// - `ImportErrorNotColumnsInFile` when the file has no columns.
  /// - `ImportSuccess` when participants were successfully extracted.
  Future<void> importButtonPressed() async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: ImportUtils.extensionsAllowed,
      type: FileType.custom,
    );

    if (result == null) {
      emit(ImportErrorNotFileSelected());
      return;
    }

    final bytes = result.files.single.bytes;
    final dataFileCsv = utf8.decode(bytes?.toList() ?? []);
    final dataListed = csv.decode(dataFileCsv);

    final columnsTitleList = dataListed.first;

    if (columnsTitleList.length > 1) {
      emit(ImportSelectColumn(data: dataListed));
      return;
    }

    if (columnsTitleList.isEmpty) {
      emit(ImportErrorNotColumnsInFile());
      return;
    }

    _readColumnFromData(dataListed, 0);
  }

  void columnSelected(List<List<dynamic>> dataListed, int columnSelected) =>
      _readColumnFromData(dataListed, columnSelected);

  /// Reads a single column from the parsed CSV rows and emits
  /// an [ImportSuccess] state containing the extracted participant names.
  ///
  /// [dataListed] is the CSV content as a list of rows; the first row
  /// is expected to be the header and is skipped. [columnSelected]
  /// identifies which column index to extract. Non-string cells are
  /// ignored.
  void _readColumnFromData(List<List<dynamic>> dataListed, int columnSelected) {
    final participants = dataListed
        .skip(1)
        .map((row) => row.length > columnSelected ? row[columnSelected] : null)
        .whereType<String>()
        .toList();

    emit(ImportSuccess(participants: participants));
  }
}
