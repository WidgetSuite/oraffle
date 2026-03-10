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
import 'package:oraffle/presentation/feature/raffle/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/feature/raffle/raffle_bloc/raffle_event.dart';
import 'package:oraffle/presentation/feature/raffle/raffle_bloc/raffle_state.dart';
import 'package:oraffle/presentation/feature/raffle/widgets/import_participants_button.dart';

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
              child: TextField(
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
        ImportParticipantsButton(
          onImportSuccess: (participants) {
            controller.text = participants.join('\n');
          },
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
}
