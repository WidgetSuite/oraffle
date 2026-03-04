// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get okButton => 'OK';

  @override
  String get cancelButton => 'キャンセル';

  @override
  String get resetButton => 'リセット';

  @override
  String get reset => 'リセット';

  @override
  String get raffleTitle => '抽選';

  @override
  String get raffleTooltip => '抽選画面を開く';

  @override
  String get participantListTitle => '参加者リスト';

  @override
  String get participantListHint => '改行で区切られた名前を入力してください';

  @override
  String get participantListPlaceholder => '参加者の名前をここに入力してください...\n一行に一つの名前';

  @override
  String get clearList => 'リストをクリア';

  @override
  String get participants => '参加者';

  @override
  String get noParticipants => '参加者はいません';

  @override
  String get addParticipantsHint => '抽選を開始するには参加者を追加してください';

  @override
  String get activeParticipants => 'アクティブな参加者';

  @override
  String get alreadySelected => '既に選択済み';

  @override
  String totalParticipants(int count) {
    return '総参加者数';
  }

  @override
  String activeVsWinners(int active, int winners) {
    return '$active人アクティブ、$winners人当選';
  }

  @override
  String get startRaffle => '抽選開始';

  @override
  String get raffling => '抽選中...';

  @override
  String get selectingWinner => '当選者を選択中...';

  @override
  String get allParticipantsSelected => 'すべての参加者が選択されました';

  @override
  String get addParticipantsToStart => '抽選を開始するには参加者を追加してください';

  @override
  String participantsReadyCount(int count) {
    return '$count人が抽選の準備ができています';
  }

  @override
  String participantDiscarded(int count) {
    return '$count 無効な参加者。';
  }

  @override
  String get resetWinners => '当選者をリセット';

  @override
  String get resetWinnersConfirmTitle => '当選者をリセットしますか？';

  @override
  String get resetWinnersConfirmMessage => 'これによりすべての当選者がアクティブ参加者リストに戻されます。';

  @override
  String get resetRaffleTitle => '抽選をリセットしますか？';

  @override
  String get resetRaffleConfirmMessage => 'これによりすべての当選者とアクティブ参加者がリセットされます。';

  @override
  String get viewWinners => '当選者を見る';

  @override
  String get congratulations => '🎉 おめでとうございます！ 🎉';

  @override
  String positionLabel(int position) {
    return '第$position位';
  }

  @override
  String remainingParticipants(int count) {
    return '残りの参加者：$count人';
  }

  @override
  String get continueRaffle => '抽選を続ける';

  @override
  String get finishRaffle => '抽選を終了';

  @override
  String get winnersTitle => '当選者';

  @override
  String get shareResults => '結果を共有';

  @override
  String get noWinnersYet => 'まだ当選者はいません';

  @override
  String get performRaffleToSeeWinners => '当選者を見るには抽選を行ってください';

  @override
  String get goToRaffle => '抽選へ移動';

  @override
  String get raffleCompleted => '抽選完了！';

  @override
  String winnersSelectedCount(int count) {
    return '$count人の当選者が選ばれました';
  }

  @override
  String get newRaffle => '新しい抽選';

  @override
  String get shareResultsTitle => '抽選結果';

  @override
  String get raffleResultsLabel => '抽選結果：';

  @override
  String get close => '閉じる';

  @override
  String get share => 'コピー';

  @override
  String get shareNotImplemented => '共有機能はまだ実装されていません';

  @override
  String get firstPlace => '第1位';

  @override
  String get secondPlace => '第2位';

  @override
  String get thirdPlace => '第3位';

  @override
  String nthPlace(int position) {
    return '第$position位';
  }

  @override
  String placeLabel(String position) {
    return '順位';
  }

  @override
  String get raffleResultsHeader => '抽選結果 - null人の当選者';

  @override
  String totalWinners(int count) {
    return '総当選者数：$count人';
  }

  @override
  String get noWinnersToShare => '共有する当選者はいません';

  @override
  String get shareSuccess => '結果が正常にコピーされました';

  @override
  String get selectLogo => 'ロゴを選択';

  @override
  String get logoUrl => 'ロゴURL';

  @override
  String get logoUrlHint => '抽選用のカスタムロゴとして使用する画像のURLを入力してください';

  @override
  String get invalidLogoUrl =>
      '無効な画像URLです。.jpg、.png、.gifなどで終わる有効なURLである必要があります。';

  @override
  String get logoPreview => 'プレビュー';

  @override
  String get removeLogo => 'ロゴを削除';

  @override
  String get logoTooLargeWarning => '画像が大きすぎて保存できません。このセッション中のみ使用されます。';

  @override
  String get addCompanyLogo => '会社ロゴを追加';

  @override
  String get appTitle => 'ORaffle';

  @override
  String get homeSubtitle => 'あなたの会社のための公平で透明なラッフル';

  @override
  String get settingsTitle => '設定';

  @override
  String get themeColor => 'テーマカラー';

  @override
  String get saveButton => '保存';

  @override
  String get themeModeLabel => 'テーマモード';

  @override
  String get systemTheme => 'システム';

  @override
  String get lightTheme => 'ライト';

  @override
  String get darkTheme => 'ダーク';

  @override
  String get invalidHexColor => '無効なヘックスカラー';
}
