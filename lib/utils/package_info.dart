import 'package:package_info_plus/package_info_plus.dart';

class PackageInfo{
  static Future<PackageInfo> getPackageInfo() {
    return PackageInfo.getPackageInfo();
  }

  // TODO: バージョンを更新する。
  static String version = '1.2.1';
  static String title = 'QUIZ×FAMILY';

}

