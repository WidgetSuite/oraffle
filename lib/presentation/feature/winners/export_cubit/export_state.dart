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
