import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_state.dart';
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

class _SelectExtension extends StatefulWidget {
  const _SelectExtension();

  static Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (_) => _SelectExtension(),
    );
  }

  @override
  State<_SelectExtension> createState() => _SelectExtensionState();
}

class _SelectExtensionState extends State<_SelectExtension> {
  String? extensionSelected;

  List<String> extensionsAvailables = ['csv', 'xlsx', 'json'];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('¿En que formato quieres exportar?'),
      contentPadding: EdgeInsetsGeometry.all(32),
      children: [
        ...extensionsAvailables.map(
          (extension) => RadioMenuButton(
            value: extension,
            groupValue: 'extension',
            onChanged: (value) {
              extensionSelected = value;
              setState(() {});
            },
            child: Text(extension),
          ),
        ),

        SizedBox(height: 24),
        Row(
          children: [
            Spacer(),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<ExportCubit>().selectExtension(
                  extensionSelected ?? '',
                  context.read<RaffleBloc>().state.getSession,
                );
              },
              child: Text(AppLocalizations.of(context)!.selectButton),
            ),
          ],
        ),
      ],
    );
  }
}
