import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oraffle/core/l10n/app_localizations.dart';
import 'package:oraffle/presentation/feature/winners/export_cubit/export_cubit.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () => context.read<ExportCubit>().exportButtonPressed(),
      icon: const Icon(Icons.import_export),
      label: Text(AppLocalizations.of(context)!.shareResultsShort),
      style: FilledButton.styleFrom(elevation: 2, minimumSize: Size(0, 48)),
    );
  }
}
