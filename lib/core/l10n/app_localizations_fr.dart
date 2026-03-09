// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get okButton => 'OK';

  @override
  String get selectButton => 'Sélectionner';

  @override
  String get cancelButton => 'Annuler';

  @override
  String get resetButton => 'Réinitialiser';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get raffleTitle => 'Tirage au sort';

  @override
  String get raffleTooltip => 'Commencer le tirage';

  @override
  String get participantListTitle => 'Liste des participants';

  @override
  String get participantListHint => 'Entrez un nom par ligne :';

  @override
  String get participantListPlaceholder =>
      'Jean Dupont\nMarie Martin\nPierre Durand\n...';

  @override
  String get clearList => 'Vider la liste';

  @override
  String get participants => 'Participants';

  @override
  String get noParticipants => 'Aucun participant';

  @override
  String get addParticipantsHint => 'Ajoutez des noms dans la zone de texte';

  @override
  String get activeParticipants => 'Participants actifs';

  @override
  String get alreadySelected => 'Déjà sélectionnés';

  @override
  String totalParticipants(int count) {
    return 'Total : $count';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return 'Actifs : $active | Gagnants : $winners';
  }

  @override
  String get startRaffle => 'Démarrer le tirage';

  @override
  String get raffling => 'Tirage en cours...';

  @override
  String get selectingWinner => 'Sélection du gagnant...';

  @override
  String get allParticipantsSelected =>
      'Tous les participants ont déjà été sélectionnés';

  @override
  String get addParticipantsToStart =>
      'Ajoutez des participants pour commencer le tirage';

  @override
  String participantsReadyCount(int count) {
    return '$count participant(s) prêt(s) pour le tirage';
  }

  @override
  String participantDiscarded(int count) {
    return '$count participants non valides.';
  }

  @override
  String get resetWinners => 'Réinitialiser les gagnants';

  @override
  String get resetWinnersConfirmTitle => 'Réinitialiser les gagnants';

  @override
  String get resetWinnersConfirmMessage =>
      'Êtes-vous sûr de vouloir réinitialiser la liste des gagnants ? Tous les participants seront à nouveau disponibles pour le tirage.';

  @override
  String get resetRaffleTitle => 'Réinitialiser le tirage';

  @override
  String get resetRaffleConfirmMessage =>
      'Êtes-vous sûr de vouloir réinitialiser le tirage ? Tous les participants et gagnants seront perdus.';

  @override
  String get viewWinners => 'Voir les gagnants';

  @override
  String get congratulations => '🎉 Félicitations ! 🎉';

  @override
  String positionLabel(int position) {
    return 'Position : $position°';
  }

  @override
  String remainingParticipants(int count) {
    return 'Participants restants : $count';
  }

  @override
  String get continueRaffle => 'Continuer le tirage';

  @override
  String get finishRaffle => 'Terminer le tirage';

  @override
  String get winnersTitle => 'Gagnants du tirage';

  @override
  String get winnersTitleShort => 'Gagnants';

  @override
  String get shareResults => 'Partager les résultats';

  @override
  String get shareResultsShort => 'Partager';

  @override
  String get noWinnersYet => 'Pas encore de gagnants';

  @override
  String get performRaffleToSeeWinners =>
      'Effectuez un tirage pour voir les gagnants ici';

  @override
  String get goToRaffle => 'Aller au tirage';

  @override
  String get raffleCompleted => 'Tirage terminé';

  @override
  String winnersSelectedCount(int count) {
    return '$count gagnant(s) sélectionné(s)';
  }

  @override
  String get newRaffle => 'Nouveau tirage';

  @override
  String get shareResultsTitle => 'Partager les résultats';

  @override
  String get raffleResultsLabel => 'Résultats du tirage :';

  @override
  String get close => 'Fermer';

  @override
  String get share => 'Copier';

  @override
  String get shareNotImplemented => 'Fonctionnalité de partage non implémentée';

  @override
  String get firstPlace => '1er';

  @override
  String get secondPlace => '2ème';

  @override
  String get thirdPlace => '3ème';

  @override
  String nthPlace(int position) {
    return '$position°';
  }

  @override
  String placeLabel(String position) {
    return '$position place';
  }

  @override
  String get raffleResultsHeader => '🏆 RÉSULTATS DU TIRAGE 🏆';

  @override
  String totalWinners(int count) {
    return 'Total des gagnants : $count';
  }

  @override
  String get noWinnersToShare => 'Aucun gagnant.';

  @override
  String get shareSuccess => 'Résultats copiés avec succès';

  @override
  String get selectLogo => 'Sélectionner le Logo';

  @override
  String get logoUrl => 'URL du Logo';

  @override
  String get logoUrlHint =>
      'Entrez l\'URL d\'une image à utiliser comme logo personnalisé pour le tirage';

  @override
  String get invalidLogoUrl =>
      'URL d\'image invalide. Doit être une URL valide se terminant par .jpg, .png, .gif, etc.';

  @override
  String get logoPreview => 'Aperçu';

  @override
  String get removeLogo => 'Supprimer le Logo';

  @override
  String get logoTooLargeWarning =>
      'L\'image est trop grande pour être sauvegardée. Elle ne sera utilisée que pendant cette session.';

  @override
  String get addCompanyLogo => 'Ajouter le logo de l\'entreprise';

  @override
  String get appTitle => 'ORaffle';

  @override
  String get homeSubtitle =>
      'Des tirages au sort équitables et transparents pour votre entreprise';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get themeColor => 'Couleur du thème';

  @override
  String get saveButton => 'Enregistrer';

  @override
  String get themeModeLabel => 'Mode du thème';

  @override
  String get systemTheme => 'Système';

  @override
  String get lightTheme => 'Clair';

  @override
  String get darkTheme => 'Sombre';

  @override
  String get invalidHexColor => 'Couleur hexadécimale non valide';

  @override
  String get statLabelTotal => 'Total';

  @override
  String get statLabelActive => 'Actifs';

  @override
  String get statLabelWinners => 'Gagnants';

  @override
  String get nextWinner => 'Gagnant suivant';

  @override
  String get resetToDefault => 'Réinitialiser par défaut';

  @override
  String get lowContrastWarning =>
      'Faible contraste avec le texte blanc. Le texte des boutons peut être difficile à lire.';

  @override
  String get importListTitle => 'Importer la liste des participants';

  @override
  String get selectNameColumn => 'Quelle colonne correspond au nom ?';

  @override
  String columnName(int column) {
    return 'Colonne : $column';
  }
}
