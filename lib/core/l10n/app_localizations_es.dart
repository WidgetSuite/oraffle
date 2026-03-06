// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get okButton => 'Aceptar';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get resetButton => 'Reiniciar';

  @override
  String get reset => 'Reiniciar';

  @override
  String get raffleTitle => 'Sorteo';

  @override
  String get raffleTooltip => 'Empezar sorteo';

  @override
  String get participantListTitle => 'Lista de Participantes';

  @override
  String get participantListHint => 'Ingresa un nombre por línea:';

  @override
  String get participantListPlaceholder =>
      'Juan Pérez\nMaría García\nPedro López\n...';

  @override
  String get clearList => 'Limpiar Lista';

  @override
  String get participants => 'Participantes';

  @override
  String get noParticipants => 'No hay participantes';

  @override
  String get addParticipantsHint => 'Agrega nombres en el área de texto';

  @override
  String get activeParticipants => 'Participantes Activos';

  @override
  String get alreadySelected => 'Ya Seleccionados';

  @override
  String totalParticipants(int count) {
    return 'Total: $count';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return 'Activos: $active | Ganadores: $winners';
  }

  @override
  String get startRaffle => 'Iniciar Sorteo';

  @override
  String get raffling => 'Sorteando...';

  @override
  String get selectingWinner => 'Seleccionando ganador...';

  @override
  String get allParticipantsSelected =>
      'Todos los participantes ya fueron seleccionados';

  @override
  String get addParticipantsToStart =>
      'Agrega participantes para comenzar el sorteo';

  @override
  String participantsReadyCount(int count) {
    return '$count participante(s) listo(s) para el sorteo';
  }

  @override
  String participantDiscarded(int count) {
    return '$count participante(s) no válido(s).';
  }

  @override
  String get resetWinners => 'Reiniciar ganadores';

  @override
  String get resetWinnersConfirmTitle => 'Reiniciar ganadores';

  @override
  String get resetWinnersConfirmMessage =>
      '¿Estás seguro de que quieres reiniciar la lista de ganadores? Todos los participantes volverán a estar disponibles para el sorteo.';

  @override
  String get resetRaffleTitle => 'Reiniciar sorteo';

  @override
  String get resetRaffleConfirmMessage =>
      '¿Estás seguro de que quieres reiniciar el sorteo? Se perderán todos los participantes y ganadores.';

  @override
  String get viewWinners => 'Ver ganadores';

  @override
  String get congratulations => '🎉 ¡Felicidades! 🎉';

  @override
  String positionLabel(int position) {
    return 'Posición: $position°';
  }

  @override
  String remainingParticipants(int count) {
    return 'Participantes restantes: $count';
  }

  @override
  String get continueRaffle => 'Continuar sorteo';

  @override
  String get finishRaffle => 'Finalizar sorteo';

  @override
  String get winnersTitle => 'Ganadores del sorteo';

  @override
  String get winnersTitleShort => 'Ganadores';

  @override
  String get shareResults => 'Compartir resultados';

  @override
  String get shareResultsShort => 'Compartir';

  @override
  String get noWinnersYet => 'No hay ganadores aún';

  @override
  String get performRaffleToSeeWinners =>
      'Realiza un sorteo para ver los ganadores aquí';

  @override
  String get goToRaffle => 'Ir al sorteo';

  @override
  String get raffleCompleted => 'Sorteo completado';

  @override
  String winnersSelectedCount(int count) {
    return '$count ganador(es) seleccionado(s)';
  }

  @override
  String get newRaffle => 'Nuevo sorteo';

  @override
  String get shareResultsTitle => 'Compartir resultados';

  @override
  String get raffleResultsLabel => 'Resultados del sorteo:';

  @override
  String get close => 'Cerrar';

  @override
  String get share => 'Copiar';

  @override
  String get shareNotImplemented =>
      'Funcionalidad de compartir no implementada';

  @override
  String get firstPlace => '1er';

  @override
  String get secondPlace => '2do';

  @override
  String get thirdPlace => '3er';

  @override
  String nthPlace(int position) {
    return '$position°';
  }

  @override
  String placeLabel(String position) {
    return '$position lugar';
  }

  @override
  String get raffleResultsHeader => '🏆 RESULTADOS DEL SORTEO 🏆';

  @override
  String totalWinners(int count) {
    return 'Total de ganadores: $count';
  }

  @override
  String get noWinnersToShare => 'No hay ganadores.';

  @override
  String get shareSuccess => 'Resultados copiados con éxito';

  @override
  String get selectLogo => 'Seleccionar logo';

  @override
  String get logoUrl => 'URL del logo';

  @override
  String get logoUrlHint =>
      'Introduce la URL de una imagen que se usará como logo personalizado para el sorteo';

  @override
  String get invalidLogoUrl =>
      'URL de imagen inválida. Debe ser una URL válida que termine en .jpg, .png, .gif, etc.';

  @override
  String get logoPreview => 'Vista previa';

  @override
  String get removeLogo => 'Eliminar Logo';

  @override
  String get logoTooLargeWarning =>
      'La imagen es demasiado grande para guardarse. Solo se usará durante esta sesión.';

  @override
  String get addCompanyLogo => 'Añadir logo de empresa';

  @override
  String get appTitle => 'ORaffle';

  @override
  String get homeSubtitle => 'Sorteos justos y transparentes para su empresa';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get themeColor => 'Color del tema';

  @override
  String get saveButton => 'Guardar';

  @override
  String get themeModeLabel => 'Modo del tema';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get lightTheme => 'Claro';

  @override
  String get darkTheme => 'Oscuro';

  @override
  String get invalidHexColor => 'Color hexadecimal inválido';

  @override
  String get statLabelTotal => 'Total';

  @override
  String get statLabelActive => 'Activos';

  @override
  String get statLabelWinners => 'Ganadores';

  @override
  String get nextWinner => 'Siguiente ganador';

  @override
  String get resetToDefault => 'Restablecer por defecto';

  @override
  String get lowContrastWarning =>
      'Bajo contraste con texto blanco. El texto de los botones puede ser difícil de leer.';
}
