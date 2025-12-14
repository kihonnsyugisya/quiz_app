
import 'package:quiz_app/utils/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._();

  static final _instance = SharedPreference._internal();

  SharedPreference._internal();

  factory SharedPreference(){
    return _instance;
  }

  SharedPreferences? _prefs;
  String status = 0.toString();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // _prefsが初期化されていない場合は初期化してから取得
  Future<void> _ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<String> getStatus() async {
    await _ensureInitialized();
    status = _prefs!.getString('status') ?? '0';
    // ignore: avoid_print, unnecessary_brace_in_string_interps
    print('status = ${status}');
    return status;
  }

  Future<void> setStatus() async {
    await _ensureInitialized();
    await _prefs!.setString('status', PackageInfo.version);
  }

  // 最後に表示したPRのバージョンを取得
  Future<String?> getLastShownPrVersion() async {
    await _ensureInitialized();
    return _prefs!.getString('lastShownPrVersion');
  }

  // 最後に表示したPRのバージョンを保存
  Future<void> setLastShownPrVersion(String version) async {
    await _ensureInitialized();
    await _prefs!.setString('lastShownPrVersion', version);
  }

  // 最後に表示したPRメッセージのハッシュ値を取得
  Future<String?> getLastShownPrHash() async {
    await _ensureInitialized();
    return _prefs!.getString('lastShownPrHash');
  }

  // 最後に表示したPRメッセージのハッシュ値を保存
  Future<void> setLastShownPrHash(String hash) async {
    await _ensureInitialized();
    await _prefs!.setString('lastShownPrHash', hash);
  }

  void getRestStatus() {
    status = '0';
  }

}