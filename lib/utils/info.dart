
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:quiz_app/utils/package_info.dart';
import 'package:quiz_app/utils/shared_preference.dart';

class Info{
  // TODO: 起動時に表示されるPRを更新する。（アップデート時）
  static Map<String, Map<String, String>> prList = {
    '1.0.0': {'pr': '1.0.0のpr文がきます。'},
    '1.0.1': {'pr': '1.0.1のpr文がきます。'},
    '1.0.2': {'pr': '1.0.2のpr文がきます。'},
    '1.0.3': {'pr': '1.0.3のpr文がきます。'},
  };

  // TODO: TOPに表示される告知を適宜更新する。（アップデート時）
  static String information ='[次回アップデートのお知らせ] 次回アップデート予定は、アニメ第●話放送後に実装予定です。たくさんアニメを見てクイズを追加していきます！';

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
      
      // メッセージ内容が変わっている場合は表示する（更新忘れの安全策）
      if (lastShownPrHash != currentPrHash) {
        return true;
      }
    }
    
    // 同じバージョンでメッセージ内容も同じ場合は表示しない
    return false;
  }

  static String getPr(){
    return prList[PackageInfo.version]!['pr'] ?? '今日も遊んでくれてありがとう！これからもみんながもっと楽しんでもらえるようにアップデートしていきますので、よろしくお願いします。';
  }

}