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
