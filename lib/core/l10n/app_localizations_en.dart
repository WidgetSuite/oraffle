// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get okButton => 'OK';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get resetButton => 'Reset';

  @override
  String get reset => 'Reset';

  @override
  String get raffleTitle => 'Raffle';

  @override
  String get raffleTooltip => 'Start raffle';

  @override
  String get participantListTitle => 'Participant List';

  @override
  String get participantListHint => 'Enter one name per line:';

  @override
  String get participantListPlaceholder =>
      'John Doe\nJane Smith\nBob Johnson\n...';

  @override
  String get clearList => 'Clear List';

  @override
  String get participants => 'Participants';

  @override
  String get noParticipants => 'No participants';

  @override
  String get addParticipantsHint => 'Add names in the text area';

  @override
  String get activeParticipants => 'Active Participants';

  @override
  String get alreadySelected => 'Already Selected';

  @override
  String totalParticipants(int count) {
    return 'Total: $count';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return 'Active: $active | Winners: $winners';
  }

  @override
  String get startRaffle => 'Start Raffle';

  @override
  String get raffling => 'Raffling...';

  @override
  String get selectingWinner => 'Selecting winner...';

  @override
  String get allParticipantsSelected =>
      'All participants have already been selected';

  @override
  String get addParticipantsToStart => 'Add participants to start the raffle';

  @override
  String participantsReadyCount(int count) {
    return '$count participant(s) ready for raffle';
  }

  @override
  String participantDiscarded(int count) {
    return '$count invalid participants.';
  }

  @override
  String get resetWinners => 'Reset Winners';

  @override
  String get resetWinnersConfirmTitle => 'Reset Winners';

  @override
  String get resetWinnersConfirmMessage =>
      'Are you sure you want to reset the winners list? All participants will be available for the raffle again.';

  @override
  String get resetRaffleTitle => 'Reset Raffle';

  @override
  String get resetRaffleConfirmMessage =>
      'Are you sure you want to reset the raffle? All participants and winners will be lost.';

  @override
  String get viewWinners => 'View winners';

  @override
  String get congratulations => '🎉 Congratulations! 🎉';

  @override
  String positionLabel(int position) {
    return 'Position: $position°';
  }

  @override
  String remainingParticipants(int count) {
    return 'Remaining participants: $count';
  }

  @override
  String get continueRaffle => 'Continue Raffle';

  @override
  String get finishRaffle => 'Finish Raffle';

  @override
  String get winnersTitle => 'Raffle Winners';

  @override
  String get shareResults => 'Share results';

  @override
  String get noWinnersYet => 'No winners yet';

  @override
  String get performRaffleToSeeWinners =>
      'Perform a raffle to see the winners here';

  @override
  String get goToRaffle => 'Go to Raffle';

  @override
  String get raffleCompleted => 'Raffle Completed';

  @override
  String winnersSelectedCount(int count) {
    return '$count winner(s) selected';
  }

  @override
  String get newRaffle => 'New Raffle';

  @override
  String get shareResultsTitle => 'Share Results';

  @override
  String get raffleResultsLabel => 'Raffle results:';

  @override
  String get close => 'Close';

  @override
  String get share => 'Copy';

  @override
  String get shareNotImplemented => 'Share functionality not implemented';

  @override
  String get firstPlace => '1st';

  @override
  String get secondPlace => '2nd';

  @override
  String get thirdPlace => '3rd';

  @override
  String nthPlace(int position) {
    return '$position°';
  }

  @override
  String placeLabel(String position) {
    return '$position place';
  }

  @override
  String get raffleResultsHeader => '🏆 RAFFLE RESULTS 🏆';

  @override
  String totalWinners(int count) {
    return 'Total winners: $count';
  }

  @override
  String get noWinnersToShare => 'No winners.';

  @override
  String get shareSuccess => 'Results copied successfully';

  @override
  String get selectLogo => 'Select Logo';

  @override
  String get logoUrl => 'Logo URL';

  @override
  String get logoUrlHint =>
      'Enter the URL of an image to use as a custom logo for the raffle';

  @override
  String get invalidLogoUrl =>
      'Invalid image URL. Must be a valid URL ending in .jpg, .png, .gif, etc.';

  @override
  String get logoPreview => 'Preview';

  @override
  String get removeLogo => 'Remove Logo';

  @override
  String get logoTooLargeWarning =>
      'Image is too large to be saved. It will only be used during this session.';

  @override
  String get addCompanyLogo => 'Add company logo';

  @override
  String get appTitle => 'ORaffle';

  @override
  String get homeSubtitle => 'Fair and transparent raffles for your company';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get themeColor => 'Theme Color';

  @override
  String get saveButton => 'Save';

  @override
  String get themeModeLabel => 'Theme Mode';

  @override
  String get systemTheme => 'System';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get invalidHexColor => 'Invalid hex color';

  @override
  String get statLabelTotal => 'Total';

  @override
  String get statLabelActive => 'Active';

  @override
  String get statLabelWinners => 'Winners';
}
