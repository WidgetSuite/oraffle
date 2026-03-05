// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get okButton => 'ΟΚ';

  @override
  String get cancelButton => 'Ακύρωση';

  @override
  String get resetButton => 'Επαναφορά';

  @override
  String get reset => 'Επαναφορά';

  @override
  String get raffleTitle => 'Κλήρωση';

  @override
  String get raffleTooltip => 'Κλήρωση';

  @override
  String get participantListTitle => 'Λίστα Συμμετεχόντων';

  @override
  String get participantListHint => 'Εισάγετε ένα όνομα ανά γραμμή:';

  @override
  String get participantListPlaceholder =>
      'Γιάννης Παπαδόπουλος\nΜαρία Ιωαννίδου\nΝίκος Γεωργίου\n...';

  @override
  String get clearList => 'Καθαρισμός Λίστας';

  @override
  String get participants => 'Συμμετέχοντες';

  @override
  String get noParticipants => 'Κανένας συμμετέχων';

  @override
  String get addParticipantsHint => 'Προσθέστε ονόματα στην περιοχή κειμένου';

  @override
  String get activeParticipants => 'Ενεργοί Συμμετέχοντες';

  @override
  String get alreadySelected => 'Ήδη Επιλεγμένοι';

  @override
  String totalParticipants(int count) {
    return 'Σύνολο: $count';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return 'Ενεργοί: $active | Νικητές: $winners';
  }

  @override
  String get startRaffle => 'Έναρξη Κλήρωσης';

  @override
  String get raffling => 'Κλήρωση...';

  @override
  String get selectingWinner => 'Επιλογή νικητή...';

  @override
  String get allParticipantsSelected =>
      'Όλοι οι συμμετέχοντες έχουν ήδη επιλεγεί';

  @override
  String get addParticipantsToStart =>
      'Προσθέστε συμμετέχοντες για να ξεκινήσετε την κλήρωση';

  @override
  String participantsReadyCount(int count) {
    return '$count συμμετέχων/οντες έτοιμος/οι για κλήρωση';
  }

  @override
  String participantDiscarded(int count) {
    return '$count μη έγκυροι συμμετέχοντες.';
  }

  @override
  String get resetWinners => 'Επαναφορά Νικητών';

  @override
  String get resetWinnersConfirmTitle => 'Επαναφορά Νικητών';

  @override
  String get resetWinnersConfirmMessage =>
      'Είστε σίγουροι ότι θέλετε να επαναφέρετε τη λίστα νικητών; Όλοι οι συμμετέχοντες θα είναι διαθέσιμοι για την κλήρωση ξανά.';

  @override
  String get resetRaffleTitle => 'Επαναφορά Κλήρωσης';

  @override
  String get resetRaffleConfirmMessage =>
      'Είστε σίγουροι ότι θέλετε να επαναφέρετε την κλήρωση; Όλοι οι συμμετέχοντες και οι νικητές θα χαθούν.';

  @override
  String get viewWinners => 'Προβολή νικητών';

  @override
  String get congratulations => '🎉 Συγχαρητήρια! 🎉';

  @override
  String positionLabel(int position) {
    return 'Θέση: $positionη';
  }

  @override
  String remainingParticipants(int count) {
    return 'Υπόλοιποι συμμετέχοντες: $count';
  }

  @override
  String get continueRaffle => 'Συνέχεια Κλήρωσης';

  @override
  String get finishRaffle => 'Ολοκλήρωση Κλήρωσης';

  @override
  String get winnersTitle => 'Νικητές Κλήρωσης';

  @override
  String get shareResults => 'Κοινοποίηση αποτελεσμάτων';

  @override
  String get noWinnersYet => 'Δεν υπάρχουν νικητές ακόμα';

  @override
  String get performRaffleToSeeWinners =>
      'Πραγματοποιήστε μια κλήρωση για να δείτε τους νικητές εδώ';

  @override
  String get goToRaffle => 'Μετάβαση στην Κλήρωση';

  @override
  String get raffleCompleted => 'Κλήρωση Ολοκληρώθηκε';

  @override
  String winnersSelectedCount(int count) {
    return '$count νικητής/ές επιλέχθηκε/αν';
  }

  @override
  String get newRaffle => 'Νέα Κλήρωση';

  @override
  String get shareResultsTitle => 'Κοινοποίηση Αποτελεσμάτων';

  @override
  String get raffleResultsLabel => 'Αποτελέσματα κλήρωσης:';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get share => 'Αντιγραφή';

  @override
  String get shareNotImplemented =>
      'Η λειτουργία κοινοποίησης δεν έχει υλοποιηθεί';

  @override
  String get firstPlace => '1ος';

  @override
  String get secondPlace => '2ος';

  @override
  String get thirdPlace => '3ος';

  @override
  String nthPlace(int position) {
    return '$positionος';
  }

  @override
  String placeLabel(String position) {
    return '$position θέση';
  }

  @override
  String get raffleResultsHeader => '🏆 ΑΠΟΤΕΛΕΣΜΑΤΑ ΚΛΗΡΩΣΗΣ 🏆';

  @override
  String totalWinners(int count) {
    return 'Σύνολο νικητών: $count';
  }

  @override
  String get noWinnersToShare => 'Κανένας νικητής.';

  @override
  String get shareSuccess => 'Τα αποτελέσματα αντιγράφηκαν επιτυχώς';

  @override
  String get selectLogo => 'Επιλογή Λογότυπου';

  @override
  String get logoUrl => 'URL Λογότυπου';

  @override
  String get logoUrlHint =>
      'Εισάγετε το URL μιας εικόνας για χρήση ως προσαρμοσμένο λογότυπο για την κλήρωση';

  @override
  String get invalidLogoUrl =>
      'Μη έγκυρο URL εικόνας. Πρέπει να είναι έγκυρο URL που τελειώνει σε .jpg, .png, .gif, κλπ.';

  @override
  String get logoPreview => 'Προεπισκόπηση';

  @override
  String get removeLogo => 'Αφαίρεση Λογότυπου';

  @override
  String get logoTooLargeWarning =>
      'Η εικόνα είναι πολύ μεγάλη για να αποθηκευτεί. Θα χρησιμοποιηθεί μόνο κατά τη διάρκεια αυτής της συνεδρίας.';

  @override
  String get addCompanyLogo => 'Προσθήκη λογότυπου εταιρείας';

  @override
  String get appTitle => 'ORaffle';

  @override
  String get homeSubtitle =>
      'Δίκαιες και διαφανείς κληρώσεις για την εταιρεία σας';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get themeColor => 'Χρώμα θέματος';

  @override
  String get saveButton => 'Αποθήκευση';

  @override
  String get themeModeLabel => 'Λειτουργία θέματος';

  @override
  String get systemTheme => 'Σύστημα';

  @override
  String get lightTheme => 'Φωτεινό';

  @override
  String get darkTheme => 'Σκοτεινό';

  @override
  String get invalidHexColor => 'Μη έγκυρο δεκαεξαδικό χρώμα';

  @override
  String get statLabelTotal => 'Σύνολο';

  @override
  String get statLabelActive => 'Ενεργοί';

  @override
  String get statLabelWinners => 'Νικητές';
}
