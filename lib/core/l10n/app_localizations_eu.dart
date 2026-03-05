// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get okButton => 'Ados';

  @override
  String get cancelButton => 'Utzi';

  @override
  String get resetButton => 'Berrezarri';

  @override
  String get reset => 'Berrezarri';

  @override
  String get raffleTitle => 'Zozketa';

  @override
  String get raffleTooltip => 'Zozketa pantaila ireki';

  @override
  String get participantListTitle => 'Parte-hartzaileen Zerrenda';

  @override
  String get participantListHint => 'Sartu izenak lerro jauziez bereizita';

  @override
  String get participantListPlaceholder =>
      'Sartu parte-hartzaileen izenak hemen...\nIzen bat lerro bakoitzeko';

  @override
  String get clearList => 'Zerrenda Garbitu';

  @override
  String get participants => 'Parte-hartzaileak';

  @override
  String get noParticipants => 'Ez dago parte-hartzailerik';

  @override
  String get addParticipantsHint => 'Gehitu parte-hartzaileak zozketa hasteko';

  @override
  String get activeParticipants => 'Parte-hartzaile Aktiboak';

  @override
  String get alreadySelected => 'Jadanik Hautatuta';

  @override
  String totalParticipants(int count) {
    return 'Parte-hartzaile Guztira';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return '$active aktibo, $winners irabazle';
  }

  @override
  String get startRaffle => 'Zozketa Hasi';

  @override
  String get raffling => 'Zozkatzen...';

  @override
  String get selectingWinner => 'Irabazlea hautatzen...';

  @override
  String get allParticipantsSelected => 'Parte-hartzaile guztiak hautatu dira';

  @override
  String get addParticipantsToStart =>
      'Gehitu parte-hartzaileak zozketa hasteko';

  @override
  String participantsReadyCount(int count) {
    return '$count parte-hartzaile prest zozketarako';
  }

  @override
  String participantDiscarded(int count) {
    return '$count parte-hartzaile baliogabeak.';
  }

  @override
  String get resetWinners => 'Irabazleak Berrezarri';

  @override
  String get resetWinnersConfirmTitle => 'Irabazleak berrezarri?';

  @override
  String get resetWinnersConfirmMessage =>
      'Honek irabazle guztiak parte-hartzaile aktiboen zerrendara itzuliko ditu.';

  @override
  String get resetRaffleTitle => 'Zozketa berrezarri?';

  @override
  String get resetRaffleConfirmMessage =>
      'Honek irabazle eta parte-hartzaile aktibo guztiak berrezarriko ditu.';

  @override
  String get viewWinners => 'Irabazleak Ikusi';

  @override
  String get congratulations => '🎉 Zorionak! 🎉';

  @override
  String positionLabel(int position) {
    return '$position. Posizioa';
  }

  @override
  String remainingParticipants(int count) {
    return 'Gainerako parte-hartzaileak: $count';
  }

  @override
  String get continueRaffle => 'Zozketa Jarraitu';

  @override
  String get finishRaffle => 'Zozketa Amaitu';

  @override
  String get winnersTitle => 'Irabazleak';

  @override
  String get shareResults => 'Emaitzak Partekatu';

  @override
  String get noWinnersYet => 'Oraindik ez dago irabazlerik';

  @override
  String get performRaffleToSeeWinners => 'Egin zozketa irabazleak ikusteko';

  @override
  String get goToRaffle => 'Zozketara Joan';

  @override
  String get raffleCompleted => 'Zozketa osatuta!';

  @override
  String winnersSelectedCount(int count) {
    return '$count irabazle hautatu dira';
  }

  @override
  String get newRaffle => 'Zozketa Berria';

  @override
  String get shareResultsTitle => 'Zozketaren Emaitzak';

  @override
  String get raffleResultsLabel => 'Zozketaren emaitzak:';

  @override
  String get close => 'Itxi';

  @override
  String get share => 'Kopiatu';

  @override
  String get shareNotImplemented =>
      'Partekatzea ez dago oraindik inplementatuta';

  @override
  String get firstPlace => 'Lehen Posizioa';

  @override
  String get secondPlace => 'Bigarren Posizioa';

  @override
  String get thirdPlace => 'Hirugarren Posizioa';

  @override
  String nthPlace(int position) {
    return '$position. Posizioa';
  }

  @override
  String placeLabel(String position) {
    return 'Posizioa';
  }

  @override
  String get raffleResultsHeader => 'Zozketaren Emaitzak - null irabazle';

  @override
  String totalWinners(int count) {
    return 'Irabazle guztira: $count';
  }

  @override
  String get noWinnersToShare => 'Ez dago irabazlerik partekatzeko';

  @override
  String get shareSuccess => 'Emaitzak arrakastaz kopiatu dira';

  @override
  String get selectLogo => 'Logotipoa Aukeratu';

  @override
  String get logoUrl => 'Logoaren URLa';

  @override
  String get logoUrlHint =>
      'Sartu zozketarako logo pertsonalizatu gisa erabiltzeko irudiaren URLa';

  @override
  String get invalidLogoUrl =>
      'Irudi URL baliogabea. .jpg, .png, .gif, etab.rekin amaitzen den URL baliozkoa izan behar da.';

  @override
  String get logoPreview => 'Aurrebista';

  @override
  String get removeLogo => 'Logotipoa Kendu';

  @override
  String get logoTooLargeWarning =>
      'Irudia handiegia da gorde ahal izateko. Saio honetan bakarrik erabiliko da.';

  @override
  String get addCompanyLogo => 'Gehitu enpresaren logotipoa';

  @override
  String get appTitle => 'ORaffle';

  @override
  String get homeSubtitle =>
      'Zozketa bidezkoak eta Gardenak zure enpresarentzat';

  @override
  String get settingsTitle => 'Ezarpenak';

  @override
  String get themeColor => 'Gaiaren kolorea';

  @override
  String get saveButton => 'Gorde';

  @override
  String get themeModeLabel => 'Gai modua';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get lightTheme => 'Argia';

  @override
  String get darkTheme => 'Iluna';

  @override
  String get invalidHexColor => 'Hex kolore baliogabea';

  @override
  String get statLabelTotal => 'Guztira';

  @override
  String get statLabelActive => 'Aktibo';

  @override
  String get statLabelWinners => 'Irabazleak';
}
