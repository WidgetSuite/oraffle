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
part of 'export_cubit.dart';

abstract class ExportState {}

final class ExportInitial extends ExportState {}

final class ExportSelectExtension extends ExportState {}

final class ExportInProgress extends ExportState {}

final class ExportSuccess extends ExportState {
  final String? pathOrUrl;
  ExportSuccess([this.pathOrUrl]);
}

final class ExportFailure extends ExportState {
  final String message;
  ExportFailure(this.message);
}

extension ExportStateX on ExportState {
  bool get hasToSelectExtension => this is ExportSelectExtension;
}
