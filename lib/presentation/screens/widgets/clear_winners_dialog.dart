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
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_bloc.dart';
import 'package:oraffle/presentation/blocs/raffle_bloc/raffle_event.dart';
import 'package:oraffle/core/theme/app_theme.dart';
import 'package:oraffle/core/theme/extensions/confirm_dialog_colors_extension.dart';

/// Shows a confirmation dialog to clear all winners from the raffle.
///
/// Returns a [Future<bool>] that completes with:
/// - `true` if the user confirmed and winners were cleared
/// - `false` if the user canceled the operation
Future<bool> showClearWinnersDialog(BuildContext context) async {
  final confirmed = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      final colors = context.appColors;

      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.resetWinnersConfirmTitle,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: colors.title),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(dialogContext).pop(false),
                    style: IconButton.styleFrom(
                      backgroundColor: colors.surface,
                    ),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              // Content
              Text(
                AppLocalizations.of(context)!.resetWinnersConfirmMessage,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: colors.subtitle),
              ),
              // Actions
              FilledButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.errorColor,
                ),
                child: Text(
                  AppLocalizations.of(context)!.reset,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  if (confirmed == true && context.mounted) {
    context.read<RaffleBloc>().add(ClearWinners());
    return true;
  }

  return false;
}
