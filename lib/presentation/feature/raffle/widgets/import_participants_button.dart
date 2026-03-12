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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/presentation/feature/raffle/import_cubit/import_cubit.dart';
import 'package:oraffle/presentation/widgets/error_toast.dart';

class ImportParticipantsButton extends StatelessWidget {
  const ImportParticipantsButton({super.key, required this.onImportSuccess});

  final Function(List<String> participants) onImportSuccess;

  @override
  Widget build(BuildContext context) {
    return ImportListeners(
      onImportSuccess: onImportSuccess,
      child: TextButton(
        onPressed: () => context.read<ImportCubit>().importButtonPressed(),
        child: Text(AppLocalizations.of(context)!.importListTitle),
      ),
    );
  }
}

class ImportListeners extends StatelessWidget {
  const ImportListeners({
    super.key,
    required this.child,
    required this.onImportSuccess,
  });

  final Widget child;
  final Function(List<String> participants) onImportSuccess;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ImportCubit, ImportState>(
          listenWhen: (previous, current) => current.isSuccess,
          listener: (context, state) {
            onImportSuccess(state.participantsList);
          },
        ),
        BlocListener<ImportCubit, ImportState>(
          listenWhen: (previous, current) => current.hasToSelectColumn,
          listener: (context, state) async {
            final columnSelected = await SelectNameColumn.show(
              context,
              state.columnsAvailables,
            );
            // ignore: use_build_context_synchronously
            context.read<ImportCubit>().columnSelected(
              state.rawData,
              columnSelected,
            );
          },
        ),
        BlocListener<ImportCubit, ImportState>(
          listenWhen: (previous, current) => current.isError,
          listener: (context, state) {
            if (state is ImportErrorNotColumnsInFile) {
              ErrorSnackbar.show(
                context: context,
                message: AppLocalizations.of(context)!.import_error_not_columns,
              );
            }
          },
        ),
      ],
      child: child,
    );
  }
}

class SelectNameColumn extends StatefulWidget {
  const SelectNameColumn({super.key, required this.listToSelect});

  final List<String> listToSelect;

  static Future<int> show(
    BuildContext context,
    List<String> listToSelect,
  ) async {
    final result = await showDialog<int>(
      context: context,
      builder: (_) => SelectNameColumn(listToSelect: listToSelect),
    );
    return result ?? -1;
  }

  @override
  State<SelectNameColumn> createState() => _SelectNameColumnState();
}

class _SelectNameColumnState extends State<SelectNameColumn> {
  int? indexName;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(AppLocalizations.of(context)!.selectNameColumn),
      contentPadding: EdgeInsetsGeometry.all(32),
      children: [
        DropdownMenu(
          width: double.infinity,
          menuStyle: MenuStyle(
            maximumSize: WidgetStatePropertyAll(Size(300, double.infinity)),
          ),
          onSelected: (value) {
            indexName = widget.listToSelect.indexOf(value ?? '');
            setState(() {});
          },
          dropdownMenuEntries: widget.listToSelect
              .map((entry) => DropdownMenuEntry(value: entry, label: entry))
              .toList(),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.cancelButton),
            ),
            SizedBox(width: 8),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop(indexName);
              },
              child: Text(AppLocalizations.of(context)!.selectButton),
            ),
          ],
        ),
      ],
    );
  }
}
