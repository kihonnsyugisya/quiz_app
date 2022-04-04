import 'package:package_info_plus/package_info_plus.dart';

class PackageInfo{
  static Future<PackageInfo> getPackageInfo() {
    return PackageInfo.getPackageInfo();
  }

  // TODO: バージョンを更新する。
  static String version = '1.0.0';
  static String title = 'QUIZ×APPLY';

}

