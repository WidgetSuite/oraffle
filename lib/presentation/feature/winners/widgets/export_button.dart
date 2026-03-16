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
import 'package:go_router/go_router.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/presentation/feature/raffle/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/feature/raffle/raffle_bloc/raffle_state.dart';
import 'package:oraffle/presentation/feature/winners/export_cubit/export_cubit.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExportCubit, ExportState>(
      listenWhen: (previous, current) => current.hasToSelectExtension,
      listener: _showDialogExtensionSelection,
      child: FilledButton.icon(
        onPressed: () => context.read<ExportCubit>().exportButtonPressed(),
        icon: const Icon(Icons.import_export),
        label: Text(AppLocalizations.of(context)!.export_results),
        style: FilledButton.styleFrom(elevation: 2, minimumSize: Size(0, 48)),
      ),
    );
  }

  void _showDialogExtensionSelection(BuildContext context, ExportState state) {
    _SelectExtension.show(context);
  }
}

class _SelectExtension extends StatelessWidget {
  _SelectExtension();

  static Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (_) => _SelectExtension(),
    );
  }

  final List<String> extensionsAvailables = ['csv', 'xlsx', 'json'];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(AppLocalizations.of(context)!.export_format_title),
      contentPadding: EdgeInsetsGeometry.all(32),
      children: [
        ...extensionsAvailables.map(
          (extension) => ListTile(
            title: Text(extension),
            leading: Icon(Icons.download),
            minVerticalPadding: 8,
            onTap: () {
              context.read<ExportCubit>().selectExtension(
                extension,
                context.read<RaffleBloc>().state.getSession,
              );
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}
