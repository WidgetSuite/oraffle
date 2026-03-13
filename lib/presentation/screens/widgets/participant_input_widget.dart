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
import 'dart:ui';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_event.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_state.dart';
import 'package:oraffle/presentation/blocs/settings_cubit/settings_cubit.dart';

class ParticipantInputWidget extends StatefulWidget {
  const ParticipantInputWidget({super.key});

  @override
  State<ParticipantInputWidget> createState() => _ParticipantInputWidgetState();
}

class _ParticipantInputWidgetState extends State<ParticipantInputWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    context.read<RaffleBloc>().add(UpdateParticipantText(_controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RaffleBloc, RaffleState>(
      listener: (context, state) {
        String participantText = '';

        if (state is RaffleLoaded) {
          participantText = state.session.participantText;
        } else if (state is RaffleWinnerSelected) {
          participantText = state.session.participantText;
        } else if (state is RaffleSelecting) {
          participantText = state.session.participantText;
        }

        // Update the text field if the text was updated programmatically
        if (_controller.text != participantText) {
          _controller.text = participantText;
        }
      },
      builder: (context, state) {
        // Initialize controller with current state on first build
        if (!_isInitialized) {
          String participantText = '';

          if (state is RaffleLoaded) {
            participantText = state.session.participantText;
          } else if (state is RaffleWinnerSelected) {
            participantText = state.session.participantText;
          } else if (state is RaffleSelecting) {
            participantText = state.session.participantText;
          }

          if (participantText.isNotEmpty ||
              state is RaffleLoaded ||
              state is RaffleWinnerSelected) {
            _controller.text = participantText;
            _isInitialized = true;
          }
        }

        final hasToBlur = context.select(
          (SettingsCubit cubit) => cubit.state.hasToBlur,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.participantListHint,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                Spacer(),
                _ListParticipantsActions(controller: _controller),
              ],
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200),
              child: Stack(
                children: [
                  TextField(
                    controller: _controller,
                    maxLines: null,
                    minLines: 8,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(
                        context,
                      )!.participantListPlaceholder,
                    ),
                  ),
                  if (hasToBlur)
                    Positioned.fill(
                      child: IgnorePointer(
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ListParticipantsActions extends StatelessWidget {
  const _ListParticipantsActions({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        TextButton(
          onPressed: () => _onPressedImportButton(context),
          child: Text(AppLocalizations.of(context)!.importListTitle),
        ),
        TextButton(
          onPressed: () {
            controller.clear();
          },
          child: Text(AppLocalizations.of(context)!.clearList),
        ),
      ],
    );
  }

  void _onPressedImportButton(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv'],
      type: FileType.custom,
    );
    if (result != null) {
      final bytes = result.files.single.bytes;
      final dataFileCsv = utf8.decode(bytes?.toList() ?? []);
      final lists = csv.decode(dataFileCsv);
      // ignore: use_build_context_synchronously
      final indexName = await _SelectNameColumn.show(context, lists);

      if (indexName == -1) {
        //TODO: Show error format reading file
        return;
      }

      final participants = lists
          .skip(1)
          .map((row) => row.length > indexName ? row[indexName] : null)
          .whereType<String>()
          .toList();

      controller.text = participants.join('\n');
    }
  }
}

class _SelectNameColumn extends StatefulWidget {
  const _SelectNameColumn({required this.lists});

  final List<List<dynamic>> lists;

  static Future<int> show(
    BuildContext context,
    List<List<dynamic>> lists,
  ) async {
    final result = await showDialog<int>(
      context: context,
      builder: (_) => _SelectNameColumn(lists: lists),
    );
    return result ?? -1;
  }

  @override
  State<_SelectNameColumn> createState() => _SelectNameColumnState();
}

class _SelectNameColumnState extends State<_SelectNameColumn> {
  int? indexName;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(AppLocalizations.of(context)!.selectNameColumn),
      contentPadding: EdgeInsetsGeometry.all(32),
      alignment: .center,
      children: [
        DropdownMenu(
          onSelected: (value) {
            indexName = value;
            setState(() {});
          },
          dropdownMenuEntries: widget.lists.first
              .map((e) => _valueToString(e, widget.lists.first.indexOf(e)))
              .toList()
              .asMap()
              .entries
              .map(
                (entry) => DropdownMenuEntry(
                  value: entry.key,
                  label: _valueToString(entry.value, 0),
                ),
              )
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

  String _valueToString(dynamic value, int index) {
    if (value == null || value == '') {
      return AppLocalizations.of(context)!.columnName(index);
    }
    return value.toString();
  }
}
