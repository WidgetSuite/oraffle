// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get okButton => 'موافق';

  @override
  String get cancelButton => 'إلغاء';

  @override
  String get resetButton => 'إعادة تعيين';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get raffleTitle => 'سحب القرعة';

  @override
  String get raffleTooltip => 'فتح شاشة السحب';

  @override
  String get participantListTitle => 'قائمة المشاركين';

  @override
  String get participantListHint => 'أدخل الأسماء مفصولة بسطر جديد';

  @override
  String get participantListPlaceholder =>
      'أدخل أسماء المشاركين هنا...\nاسم واحد في كل سطر';

  @override
  String get clearList => 'محو القائمة';

  @override
  String get participants => 'مشاركون';

  @override
  String get noParticipants => 'لا يوجد مشاركون';

  @override
  String get addParticipantsHint => 'أضف مشاركين لبدء السحب';

  @override
  String get activeParticipants => 'المشاركون النشطون';

  @override
  String get alreadySelected => 'تم اختيارهم مسبقاً';

  @override
  String totalParticipants(int count) {
    return 'إجمالي المشاركين';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return '$active نشطون، $winners فائزون';
  }

  @override
  String get startRaffle => 'بدء السحب';

  @override
  String get raffling => 'جاري السحب...';

  @override
  String get selectingWinner => 'اختيار الفائز...';

  @override
  String get allParticipantsSelected => 'تم اختيار جميع المشاركين';

  @override
  String get addParticipantsToStart => 'أضف مشاركين لبدء السحب';

  @override
  String participantsReadyCount(int count) {
    return '$count مشاركون جاهزون للسحب';
  }

  @override
  String participantDiscarded(int count) {
    return '$count مشاركين غير صالحين.';
  }

  @override
  String get resetWinners => 'إعادة تعيين الفائزين';

  @override
  String get resetWinnersConfirmTitle => 'إعادة تعيين الفائزين؟';

  @override
  String get resetWinnersConfirmMessage =>
      'هذا سيعيد جميع الفائزين إلى قائمة المشاركين النشطين.';

  @override
  String get resetRaffleTitle => 'إعادة تعيين السحب؟';

  @override
  String get resetRaffleConfirmMessage =>
      'هذا سيعيد تعيين جميع الفائزين والمشاركين النشطين.';

  @override
  String get viewWinners => 'عرض الفائزين';

  @override
  String get congratulations => '🎉 تهانينا! 🎉';

  @override
  String positionLabel(int position) {
    return 'المركز $position';
  }

  @override
  String remainingParticipants(int count) {
    return 'مشاركون متبقون: $count';
  }

  @override
  String get continueRaffle => 'متابعة السحب';

  @override
  String get finishRaffle => 'إنهاء السحب';

  @override
  String get winnersTitle => 'الفائزون';

  @override
  String get shareResults => 'مشاركة النتائج';

  @override
  String get noWinnersYet => 'لا يوجد فائزون بعد';

  @override
  String get performRaffleToSeeWinners => 'قم بإجراء سحب لرؤية الفائزين';

  @override
  String get goToRaffle => 'الذهاب إلى السحب';

  @override
  String get raffleCompleted => 'اكتمل السحب!';

  @override
  String winnersSelectedCount(int count) {
    return 'تم اختيار $count فائزين';
  }

  @override
  String get newRaffle => 'سحب جديد';

  @override
  String get shareResultsTitle => 'نتائج السحب';

  @override
  String get raffleResultsLabel => 'نتائج السحب:';

  @override
  String get close => 'إغلاق';

  @override
  String get share => 'نسخ';

  @override
  String get shareNotImplemented => 'المشاركة غير مطبقة بعد';

  @override
  String get firstPlace => 'المركز الأول';

  @override
  String get secondPlace => 'المركز الثاني';

  @override
  String get thirdPlace => 'المركز الثالث';

  @override
  String nthPlace(int position) {
    return 'المركز $position';
  }

  @override
  String placeLabel(String position) {
    return 'المركز';
  }

  @override
  String get raffleResultsHeader => 'نتائج السحب - null فائزين';

  @override
  String totalWinners(int count) {
    return 'إجمالي الفائزين: $count';
  }

  @override
  String get noWinnersToShare => 'لا يوجد فائزون للمشاركة';

  @override
  String get shareSuccess => 'تم نسخ النتائج بنجاح';

  @override
  String get selectLogo => 'اختيار الشعار';

  @override
  String get logoUrl => 'رابط الشعار';

  @override
  String get logoUrlHint => 'أدخل رابط صورة لاستخدامها كشعار مخصص للسحب';

  @override
  String get invalidLogoUrl =>
      'رابط صورة غير صالح. يجب أن يكون رابطاً صالحاً ينتهي بـ .jpg أو .png أو .gif إلخ.';

  @override
  String get logoPreview => 'معاينة';

  @override
  String get removeLogo => 'إزالة الشعار';

  @override
  String get logoTooLargeWarning =>
      'الصورة كبيرة جداً ولا يمكن حفظها. سيتم استخدامها فقط خلال هذه الجلسة.';

  @override
  String get addCompanyLogo => 'إضافة شعار الشركة';

  @override
  String get appTitle => 'ORaffle';

  @override
  String get homeSubtitle => 'قرعة عادلة وشفافة لشركتك';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get themeColor => 'لون المظهر';

  @override
  String get saveButton => 'حفظ';

  @override
  String get themeModeLabel => 'وضع المظهر';

  @override
  String get systemTheme => 'النظام';

  @override
  String get lightTheme => 'فاتح';

  @override
  String get darkTheme => 'داكن';

  @override
  String get invalidHexColor => 'لون سداسي عشري غير صالح';
}
