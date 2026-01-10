import 'package:package_info_plus/package_info_plus.dart';

class PackageInfo{
  static Future<PackageInfo> getPackageInfo() {
    return PackageInfo.getPackageInfo();
  }

  // TODO: タイトル、バージョンを更新する。ほんとは、package infoで動的に取得したかったがわからなくて諦めた。上記がその痕跡。
  static String version = '1.0.8';
  static String title = '呪術クイズ';

  // アプリストアID（一箇所で管理）
  static String iOSAppId = '6757211156';
  static String androidPackageId = 'com.kihonsyugisya.jujutsuQuiz';

}
