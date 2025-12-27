
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:jujutsu_kaisen_quiz/utils/package_info.dart';
import 'package:jujutsu_kaisen_quiz/utils/shared_preference.dart';

class Info{
  // TODO: 起動時に表示されるPRを更新する。（アップデート時）
  static Map<String, Map<String, String>> prList = {
    '1.0.0': {'pr': '呪術廻戦クイズアプリをリリースしました！\n\n死滅回游編を中心としたクイズを楽しめます。\n\n・通常モード：60問\n・ハードモード：30問\n\n呪術廻戦の世界をより深く楽しんでください！'},
    // '1.0.1': {'pr': '1.0.1のアップデート内容をここに記載します。'},
    // '1.0.2': {'pr': '1.0.2のアップデート内容をここに記載します。'},
    // '1.0.3': {'pr': '1.0.3のアップデート内容をここに記載します。'},
  };

  // TOPに表示される呪術廻戦の名言リスト
  static final List<String> _famousQuotes = [
    '大丈夫。僕最強だから',
    '生き様で後悔したくない',
    '俺は正義の味方（ヒーロー）じゃない、呪術師なんだ',
    '完璧も"理不尽"も応える義務がどこにある？テメェの人生は仕事かよ。',
    '生き方は決めた 後は自分にできることを精一杯やるさ',
    '己を知り、己を律する者だけが真の強さを手に入れる',
    '弱い者を守るのが強い者の役目だ',
    '負けることを恐れるな。挑戦することを恐れろ',
    '自分を信じろ。そして周りの人も信じろ',
    '諦めるな。最後まで戦い抜け',
    '呪術師として誇りを持て',
    '力を正しく使うことが呪術師の使命だ',
    '仲間を信じ、共に戦う',
    '今この瞬間を大切に生きる',
  ];
  
  // 全ての名言を「　」で結合して取得
  static String get information {
    return _famousQuotes.join('　');
  }

  // メッセージ内容のハッシュ値を計算
  static String calculatePrHash(String version) {
    final prMessage = prList[version]?['pr'] ?? '';
    final bytes = utf8.encode(prMessage);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static Future<bool> isShowInfoDialog() async {
    final sharedPref = SharedPreference();
    final status = await sharedPref.getStatus();
    final currentVersion = PackageInfo.version;
    
    // 初回起動時（status == '0'）は表示しない
    if (status == '0') {
      // 初回起動時に現在のバージョンを保存（次回アップデート時に検出できるように）
      await sharedPref.setStatus();
      return false;
    }
    
    // アップデート時（status != currentVersion かつ status != '0'）のみ表示を検討
    if (status != currentVersion) {
      // 現在のバージョンにPRが定義されているかチェック
      if (!prList.containsKey(currentVersion)) {
        // PRが定義されていない場合でも、バージョン情報は更新しておく
        await sharedPref.setStatus();
        return false;
      }
      
      // 現在のPRメッセージのハッシュ値を計算
      final currentPrHash = calculatePrHash(currentVersion);
      final lastShownPrHash = await sharedPref.getLastShownPrHash();
      
      // メッセージ内容が変わっていない場合（同じハッシュ値）は表示しない
      if (lastShownPrHash == currentPrHash) {
        // バージョン情報は更新しておく（次回のアップデート検出のため）
        await sharedPref.setStatus();
        return false;
      }
      
      // メッセージ内容が変わっている、または初めて表示する場合は表示する
      return true;
    }
    
    // 同じバージョンの場合でも、メッセージ内容が更新されている可能性をチェック
    if (prList.containsKey(currentVersion)) {
      final currentPrHash = calculatePrHash(currentVersion);
      final lastShownPrHash = await sharedPref.getLastShownPrHash();
      
      // メッセージ内容が変わっている場合は表示する（更新忘れの安全策！）
      if (lastShownPrHash != currentPrHash) {
        return true;
      }
    }
    
    // 同じバージョンでメッセージ内容も同じ場合は表示しない
    return false;
  }

  static String getPr(){
    return prList[PackageInfo.version]?['pr'] ?? '今日も遊んでくれてありがとうございます！\n\nこれからもみんながもっと楽しんでもらえるようにアップデートしていきます。\n\nよろしくお願いします！';
  }

}
