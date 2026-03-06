import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('ca'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('eu'),
    Locale('fr'),
    Locale('gl'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
  ];

  /// Generic OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButton;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// Reset button text
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetButton;

  /// Reset functionality text
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Title of the raffle functionality
  ///
  /// In en, this message translates to:
  /// **'Raffle'**
  String get raffleTitle;

  /// Tooltip for the raffle button
  ///
  /// In en, this message translates to:
  /// **'Start raffle'**
  String get raffleTooltip;

  /// Title for the participant list section
  ///
  /// In en, this message translates to:
  /// **'Participant List'**
  String get participantListTitle;

  /// Hint text for the participant input field
  ///
  /// In en, this message translates to:
  /// **'Enter one name per line:'**
  String get participantListHint;

  /// Placeholder text for the participant input field
  ///
  /// In en, this message translates to:
  /// **'John Doe\nJane Smith\nBob Johnson\n...'**
  String get participantListPlaceholder;

  /// Button text to clear the participant list
  ///
  /// In en, this message translates to:
  /// **'Clear List'**
  String get clearList;

  /// Label for the participants list
  ///
  /// In en, this message translates to:
  /// **'Participants'**
  String get participants;

  /// Message shown when the participant list is empty
  ///
  /// In en, this message translates to:
  /// **'No participants'**
  String get noParticipants;

  /// Hint text when no participants are present
  ///
  /// In en, this message translates to:
  /// **'Add names in the text area'**
  String get addParticipantsHint;

  /// Label for active participants
  ///
  /// In en, this message translates to:
  /// **'Active Participants'**
  String get activeParticipants;

  /// Label for participants already selected as winners
  ///
  /// In en, this message translates to:
  /// **'Already Selected'**
  String get alreadySelected;

  /// Total participants count
  ///
  /// In en, this message translates to:
  /// **'Total: {count}'**
  String totalParticipants(int count);

  /// Active vs winners count
  ///
  /// In en, this message translates to:
  /// **'Active: {active} | Winners: {winners}'**
  String activeVsWinners(int active, int winners);

  /// Button text to start the raffle
  ///
  /// In en, this message translates to:
  /// **'Start Raffle'**
  String get startRaffle;

  /// Text shown during the raffle animation
  ///
  /// In en, this message translates to:
  /// **'Raffling...'**
  String get raffling;

  /// Text shown during winner selection
  ///
  /// In en, this message translates to:
  /// **'Selecting winner...'**
  String get selectingWinner;

  /// Message when all participants are already winners
  ///
  /// In en, this message translates to:
  /// **'All participants have already been selected'**
  String get allParticipantsSelected;

  /// Hint message to add participants
  ///
  /// In en, this message translates to:
  /// **'Add participants to start the raffle'**
  String get addParticipantsToStart;

  /// Number of participants ready for raffle
  ///
  /// In en, this message translates to:
  /// **'{count} participant(s) ready for raffle'**
  String participantsReadyCount(int count);

  /// Message when there are invalid participants
  ///
  /// In en, this message translates to:
  /// **'{count} invalid participants.'**
  String participantDiscarded(int count);

  /// Button text to reset winners list
  ///
  /// In en, this message translates to:
  /// **'Reset Winners'**
  String get resetWinners;

  /// Confirmation title for resetting winners
  ///
  /// In en, this message translates to:
  /// **'Reset Winners'**
  String get resetWinnersConfirmTitle;

  /// Confirmation message for resetting winners
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset the winners list? All participants will be available for the raffle again.'**
  String get resetWinnersConfirmMessage;

  /// Title for resetting the entire raffle
  ///
  /// In en, this message translates to:
  /// **'Reset Raffle'**
  String get resetRaffleTitle;

  /// Confirmation message for resetting the entire raffle
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset the raffle? All participants and winners will be lost.'**
  String get resetRaffleConfirmMessage;

  /// Button to view current winners
  ///
  /// In en, this message translates to:
  /// **'View winners'**
  String get viewWinners;

  /// Congratulations message for the winner
  ///
  /// In en, this message translates to:
  /// **'🎉 Congratulations! 🎉'**
  String get congratulations;

  /// Winner position label
  ///
  /// In en, this message translates to:
  /// **'Position: {position}°'**
  String positionLabel(int position);

  /// Remaining participants count
  ///
  /// In en, this message translates to:
  /// **'Remaining participants: {count}'**
  String remainingParticipants(int count);

  /// Button to continue the raffle
  ///
  /// In en, this message translates to:
  /// **'Continue Raffle'**
  String get continueRaffle;

  /// Button to finish the raffle
  ///
  /// In en, this message translates to:
  /// **'Finish Raffle'**
  String get finishRaffle;

  /// Title for the winners screen
  ///
  /// In en, this message translates to:
  /// **'Raffle Winners'**
  String get winnersTitle;

  /// Short label for the winners button in the app bar
  ///
  /// In en, this message translates to:
  /// **'Winners'**
  String get winnersTitleShort;

  /// Button to share raffle results
  ///
  /// In en, this message translates to:
  /// **'Share results'**
  String get shareResults;

  /// Short label for the share button in the app bar
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareResultsShort;

  /// Message when no winners have been selected
  ///
  /// In en, this message translates to:
  /// **'No winners yet'**
  String get noWinnersYet;

  /// Prompt to perform a raffle
  ///
  /// In en, this message translates to:
  /// **'Perform a raffle to see the winners here'**
  String get performRaffleToSeeWinners;

  /// Navigation link to the raffle screen
  ///
  /// In en, this message translates to:
  /// **'Go to Raffle'**
  String get goToRaffle;

  /// Message when the raffle is completed
  ///
  /// In en, this message translates to:
  /// **'Raffle Completed'**
  String get raffleCompleted;

  /// Number of winners selected
  ///
  /// In en, this message translates to:
  /// **'{count} winner(s) selected'**
  String winnersSelectedCount(int count);

  /// Button to start a new raffle
  ///
  /// In en, this message translates to:
  /// **'New Raffle'**
  String get newRaffle;

  /// Title for the results sharing dialog
  ///
  /// In en, this message translates to:
  /// **'Share Results'**
  String get shareResultsTitle;

  /// Label for the results text
  ///
  /// In en, this message translates to:
  /// **'Raffle results:'**
  String get raffleResultsLabel;

  /// Generic close button text
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Button text to copy results
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get share;

  /// Message when share is not available
  ///
  /// In en, this message translates to:
  /// **'Share functionality not implemented'**
  String get shareNotImplemented;

  /// Abbreviation for 1st place
  ///
  /// In en, this message translates to:
  /// **'1st'**
  String get firstPlace;

  /// Abbreviation for 2nd place
  ///
  /// In en, this message translates to:
  /// **'2nd'**
  String get secondPlace;

  /// Abbreviation for 3rd place
  ///
  /// In en, this message translates to:
  /// **'3rd'**
  String get thirdPlace;

  /// Ordinal position label
  ///
  /// In en, this message translates to:
  /// **'{position}°'**
  String nthPlace(int position);

  /// Place label with ordinal
  ///
  /// In en, this message translates to:
  /// **'{position} place'**
  String placeLabel(String position);

  /// Header for shared raffle results
  ///
  /// In en, this message translates to:
  /// **'🏆 RAFFLE RESULTS 🏆'**
  String get raffleResultsHeader;

  /// Total winners count in shared results
  ///
  /// In en, this message translates to:
  /// **'Total winners: {count}'**
  String totalWinners(int count);

  /// Message when there are no winners to share
  ///
  /// In en, this message translates to:
  /// **'No winners.'**
  String get noWinnersToShare;

  /// Success message when results are copied
  ///
  /// In en, this message translates to:
  /// **'Results copied successfully'**
  String get shareSuccess;

  /// Button to select a custom logo
  ///
  /// In en, this message translates to:
  /// **'Select Logo'**
  String get selectLogo;

  /// Label for custom logo URL input
  ///
  /// In en, this message translates to:
  /// **'Logo URL'**
  String get logoUrl;

  /// Hint for custom logo URL input
  ///
  /// In en, this message translates to:
  /// **'Enter the URL of an image to use as a custom logo for the raffle'**
  String get logoUrlHint;

  /// Error message for invalid logo URL
  ///
  /// In en, this message translates to:
  /// **'Invalid image URL. Must be a valid URL ending in .jpg, .png, .gif, etc.'**
  String get invalidLogoUrl;

  /// Label for logo preview section
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get logoPreview;

  /// Button to remove custom logo
  ///
  /// In en, this message translates to:
  /// **'Remove Logo'**
  String get removeLogo;

  /// Warning when logo exceeds size limits
  ///
  /// In en, this message translates to:
  /// **'Image is too large to be saved. It will only be used during this session.'**
  String get logoTooLargeWarning;

  /// Text shown when no company logo is set
  ///
  /// In en, this message translates to:
  /// **'Add company logo'**
  String get addCompanyLogo;

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'ORaffle'**
  String get appTitle;

  /// Subtitle shown on the home screen
  ///
  /// In en, this message translates to:
  /// **'Fair and transparent raffles for your company'**
  String get homeSubtitle;

  /// Title for the settings dialog
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Label for theme color selection
  ///
  /// In en, this message translates to:
  /// **'Theme Color'**
  String get themeColor;

  /// Text for the save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// Label for theme mode selection
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeModeLabel;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// Error message for invalid hexadecimal color input
  ///
  /// In en, this message translates to:
  /// **'Invalid hex color'**
  String get invalidHexColor;

  /// Short label for total participants stat card
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get statLabelTotal;

  /// Short label for active participants stat card
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statLabelActive;

  /// Short label for winners stat card
  ///
  /// In en, this message translates to:
  /// **'Winners'**
  String get statLabelWinners;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'ca',
    'de',
    'el',
    'en',
    'es',
    'eu',
    'fr',
    'gl',
    'hi',
    'it',
    'ja',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'ca':
      return AppLocalizationsCa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'eu':
      return AppLocalizationsEu();
    case 'fr':
      return AppLocalizationsFr();
    case 'gl':
      return AppLocalizationsGl();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
