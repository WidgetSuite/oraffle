import 'dart:convert';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oraffle/core/utils/export/export_utils.dart';
import 'package:oraffle/domain/models/raffle/raffle_session.dart';

part 'export_state.dart';

class ExportCubit extends Cubit<ExportState> {
  ExportCubit() : super(ExportInitial());

  void exportButtonPressed() {
    emit(ExportSelectExtension());
  }

  void selectExtension(String selectedExtension, RaffleSession data) {
    if (selectedExtension == 'json') {
      _exportJsonFile(data);
    } else if (selectedExtension == 'csv') {
      _exportCsvFile(data);
    } else if (selectedExtension == 'xlsx') {
      _exportExcelFile(data);
    }
  }

  String _createNameFile(String extension) {
    final now = DateTime.now().toIso8601String().replaceAll(':', '-');
    return 'oraffle_session_$now.$extension';
  }

  void _exportJsonFile(RaffleSession data) async {
    emit(ExportInProgress());

    try {
      final Map<String, dynamic> sessionMap = {
        'participants': data.participants.map((p) => {'name': p.name}).toList(),
        'winners': data.winners
            .map(
              (w) => {
                'name': w.name,
                'position': w.position,
                'selectedAt': w.selectedAt.toIso8601String(),
              },
            )
            .toList(),
      };

      final jsonString = const JsonEncoder.withIndent('  ').convert(sessionMap);
      final bytes = Uint8List.fromList(utf8.encode(jsonString));

      final result = await downloadFile(
        _createNameFile('json'),
        bytes,
        'application/json',
      );

      emit(ExportSuccess(result));
    } catch (e) {
      emit(ExportFailure(e.toString()));
    }
  }

  void _exportCsvFile(RaffleSession data) async {
    emit(ExportInProgress());

    try {
      final StringBuffer csvBuffer = StringBuffer();

      // Participants section
      csvBuffer.writeln('=== PARTICIPANTS ===');
      if (data.participants.isNotEmpty) {
        csvBuffer.writeln('Name');
        for (final participant in data.participants) {
          csvBuffer.writeln(participant.name);
        }
      }

      csvBuffer.writeln();

      // Winners section
      csvBuffer.writeln('=== WINNERS ===');
      if (data.winners.isNotEmpty) {
        csvBuffer.writeln('Position,Name,Selected At');
        for (final winner in data.winners) {
          csvBuffer.writeln(
            '"${winner.position}","${winner.name}","${winner.selectedAt.toIso8601String()}"',
          );
        }
      }

      final bytes = Uint8List.fromList(utf8.encode(csvBuffer.toString()));

      final result = await downloadFile(
        _createNameFile('.csv'),
        bytes,
        'text/csv',
      );

      emit(ExportSuccess(result));
    } catch (e) {
      emit(ExportFailure(e.toString()));
    }
  }

  void _exportExcelFile(RaffleSession data) async {
    emit(ExportInProgress());

    try {
      final excel = Excel.createExcel();

      // Create Participants sheet
      final participantsSheet = excel['Participants'];
      participantsSheet.insertRowIterables([TextCellValue('Name')], 0);
      for (int i = 0; i < data.participants.length; i++) {
        participantsSheet.insertRowIterables([
          TextCellValue(data.participants[i].name),
        ], i + 1);
      }

      // Create Winners sheet
      final winnersSheet = excel['Winners'];
      winnersSheet.insertRowIterables([
        TextCellValue('Position'),
        TextCellValue('Name'),
        TextCellValue('Selected At'),
      ], 0);
      for (int i = 0; i < data.winners.length; i++) {
        final winner = data.winners[i];
        winnersSheet.insertRowIterables([
          IntCellValue(winner.position),
          TextCellValue(winner.name),
          TextCellValue(winner.selectedAt.toIso8601String()),
        ], i + 1);
      }

      excel.delete('Sheet1');
      final bytes = excel.encode();
      if (bytes == null) throw Exception('Failed to encode Excel file');

      final fileName = _createNameFile('xlsx');

      final result = await downloadFile(
        fileName,
        Uint8List.fromList(bytes),
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      );

      emit(ExportSuccess(result));
    } catch (e) {
      emit(ExportFailure(e.toString()));
    }
  }
}
