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

/// Shows a confirmation dialog to reset the entire raffle.
///
/// Returns a [Future<bool>] that completes with:
/// - `true` if the user confirmed and the raffle was reset
/// - `false` if the user canceled the operation
Future<bool> showResetRaffleDialog(BuildContext context) async {
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
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.resetRaffleTitle,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: colors.title,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(dialogContext).pop(false),
                    style: IconButton.styleFrom(
                      backgroundColor: colors.surface,
                      fixedSize: const Size(40, 40),
                      padding: EdgeInsets.zero,
                    ),
                    icon: Icon(Icons.close, size: 20, color: colors.subtitle),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Content
              Text(
                AppLocalizations.of(context)!.resetRaffleConfirmMessage,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: colors.subtitle,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              // Actions
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(dialogContext).pop(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.errorColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.reset,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  if (confirmed == true && context.mounted) {
    context.read<RaffleBloc>().add(ResetRaffle());
    return true;
  }

  return false;
}
