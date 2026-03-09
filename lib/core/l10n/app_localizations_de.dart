// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get okButton => 'OK';

  @override
  String get selectButton => 'Auswählen';

  @override
  String get cancelButton => 'Abbrechen';

  @override
  String get resetButton => 'Zurücksetzen';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get raffleTitle => 'Verlosung';

  @override
  String get raffleTooltip => 'Verlosung starten';

  @override
  String get participantListTitle => 'Teilnehmerliste';

  @override
  String get participantListHint => 'Geben Sie einen Namen pro Zeile ein:';

  @override
  String get participantListPlaceholder =>
      'Max Mustermann\nErika Musterfrau\nHans Schmidt\n...';

  @override
  String get clearList => 'Liste löschen';

  @override
  String get participants => 'Teilnehmer';

  @override
  String get noParticipants => 'Keine Teilnehmer';

  @override
  String get addParticipantsHint => 'Fügen Sie Namen im Textbereich hinzu';

  @override
  String get activeParticipants => 'Aktive Teilnehmer';

  @override
  String get alreadySelected => 'Bereits ausgewählt';

  @override
  String totalParticipants(int count) {
    return 'Gesamt: $count';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return 'Aktiv: $active | Gewinner: $winners';
  }

  @override
  String get startRaffle => 'Verlosung starten';

  @override
  String get raffling => 'Verlosung läuft...';

  @override
  String get selectingWinner => 'Gewinner wird ausgewählt...';

  @override
  String get allParticipantsSelected =>
      'Alle Teilnehmer wurden bereits ausgewählt';

  @override
  String get addParticipantsToStart =>
      'Fügen Sie Teilnehmer hinzu, um die Verlosung zu starten';

  @override
  String participantsReadyCount(int count) {
    return '$count Teilnehmer bereit für Verlosung';
  }

  @override
  String participantDiscarded(int count) {
    return '$count ungültige Teilnehmer.';
  }

  @override
  String get resetWinners => 'Gewinner zurücksetzen';

  @override
  String get resetWinnersConfirmTitle => 'Gewinner zurücksetzen';

  @override
  String get resetWinnersConfirmMessage =>
      'Sind Sie sicher, dass Sie die Gewinnerliste zurücksetzen möchten? Alle Teilnehmer werden wieder für die Verlosung verfügbar sein.';

  @override
  String get resetRaffleTitle => 'Verlosung zurücksetzen';

  @override
  String get resetRaffleConfirmMessage =>
      'Sind Sie sicher, dass Sie die Verlosung zurücksetzen möchten? Alle Teilnehmer und Gewinner gehen verloren.';

  @override
  String get viewWinners => 'Gewinner anzeigen';

  @override
  String get congratulations => '🎉 Herzlichen Glückwunsch! 🎉';

  @override
  String positionLabel(int position) {
    return 'Position: $position°';
  }

  @override
  String remainingParticipants(int count) {
    return 'Verbleibende Teilnehmer: $count';
  }

  @override
  String get continueRaffle => 'Verlosung fortsetzen';

  @override
  String get finishRaffle => 'Verlosung beenden';

  @override
  String get winnersTitle => 'Verlosungsgewinner';

  @override
  String get winnersTitleShort => 'Gewinner';

  @override
  String get shareResults => 'Ergebnisse teilen';

  @override
  String get shareResultsShort => 'Teilen';

  @override
  String get noWinnersYet => 'Noch keine Gewinner';

  @override
  String get performRaffleToSeeWinners =>
      'Führen Sie eine Verlosung durch, um die Gewinner hier zu sehen';

  @override
  String get goToRaffle => 'Zur Verlosung';

  @override
  String get raffleCompleted => 'Verlosung abgeschlossen';

  @override
  String winnersSelectedCount(int count) {
    return '$count Gewinner ausgewählt';
  }

  @override
  String get newRaffle => 'Neue Verlosung';

  @override
  String get shareResultsTitle => 'Ergebnisse teilen';

  @override
  String get raffleResultsLabel => 'Verlosungsergebnisse:';

  @override
  String get close => 'Schließen';

  @override
  String get share => 'Kopieren';

  @override
  String get shareNotImplemented => 'Teilen-Funktion nicht implementiert';

  @override
  String get firstPlace => '1.';

  @override
  String get secondPlace => '2.';

  @override
  String get thirdPlace => '3.';

  @override
  String nthPlace(int position) {
    return '$position.';
  }

  @override
  String placeLabel(String position) {
    return '$position Platz';
  }

  @override
  String get raffleResultsHeader => '🏆 VERLOSUNGSERGEBNISSE 🏆';

  @override
  String totalWinners(int count) {
    return 'Gewinner gesamt: $count';
  }

  @override
  String get noWinnersToShare => 'Keine Gewinner.';

  @override
  String get shareSuccess => 'Ergebnisse erfolgreich kopiert';

  @override
  String get selectLogo => 'Logo auswählen';

  @override
  String get logoUrl => 'Logo-URL';

  @override
  String get logoUrlHint =>
      'Geben Sie die URL eines Bildes ein, das als benutzerdefiniertes Logo für die Verlosung verwendet werden soll';

  @override
  String get invalidLogoUrl =>
      'Ungültige Bild-URL. Muss eine gültige URL sein, die mit .jpg, .png, .gif usw. endet.';

  @override
  String get logoPreview => 'Vorschau';

  @override
  String get removeLogo => 'Logo entfernen';

  @override
  String get logoTooLargeWarning =>
      'Das Bild ist zu groß zum Speichern. Es wird nur während dieser Sitzung verwendet.';

  @override
  String get addCompanyLogo => 'Firmenlogo hinzufügen';

  @override
  String get appTitle => 'ORaffle';

  @override
  String get homeSubtitle =>
      'Faire und transparente Gewinnspiele für Ihr Unternehmen';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get themeColor => 'Themenfarbe';

  @override
  String get saveButton => 'Speichern';

  @override
  String get themeModeLabel => 'Themenmodus';

  @override
  String get systemTheme => 'System';

  @override
  String get lightTheme => 'Hell';

  @override
  String get darkTheme => 'Dunkel';

  @override
  String get invalidHexColor => 'Ungültige Hex-Farbe';

  @override
  String get statLabelTotal => 'Gesamt';

  @override
  String get statLabelActive => 'Aktiv';

  @override
  String get statLabelWinners => 'Gewinner';

  @override
  String get nextWinner => 'Nächster Gewinner';

  @override
  String get resetToDefault => 'Auf Standard zurücksetzen';

  @override
  String get lowContrastWarning =>
      'Geringer Kontrast mit weißem Text. Der Schaltflächentext ist möglicherweise schwer lesbar.';

  @override
  String get importListTitle => 'Teilnehmerliste importieren';

  @override
  String get selectNameColumn => 'Welche Spalte entspricht dem Namen?';

  @override
  String columnName(int column) {
    return 'Spalte: $column';
  }
}
