
import 'package:jujutsu_kaisen_quiz/utils/package_info.dart';
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

  // _prefs縺悟・譛溷喧縺輔ｌ縺ｦ縺・↑縺・ｴ蜷医・蛻晄悄蛹悶＠縺ｦ縺九ｉ蜿門ｾ・
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

  // 譛蠕後↓陦ｨ遉ｺ縺励◆PR縺ｮ繝舌・繧ｸ繝ｧ繝ｳ繧貞叙蠕・
  Future<String?> getLastShownPrVersion() async {
    await _ensureInitialized();
    return _prefs!.getString('lastShownPrVersion');
  }

  // 譛蠕後↓陦ｨ遉ｺ縺励◆PR縺ｮ繝舌・繧ｸ繝ｧ繝ｳ繧剃ｿ晏ｭ・
  Future<void> setLastShownPrVersion(String version) async {
    await _ensureInitialized();
    await _prefs!.setString('lastShownPrVersion', version);
  }

  // 譛蠕後↓陦ｨ遉ｺ縺励◆PR繝｡繝・そ繝ｼ繧ｸ縺ｮ繝上ャ繧ｷ繝･蛟､繧貞叙蠕・
  Future<String?> getLastShownPrHash() async {
    await _ensureInitialized();
    return _prefs!.getString('lastShownPrHash');
  }

  // 譛蠕後↓陦ｨ遉ｺ縺励◆PR繝｡繝・そ繝ｼ繧ｸ縺ｮ繝上ャ繧ｷ繝･蛟､繧剃ｿ晏ｭ・
  Future<void> setLastShownPrHash(String hash) async {
    await _ensureInitialized();
    await _prefs!.setString('lastShownPrHash', hash);
  }

  void getRestStatus() {
    status = '0';
  }

  // 繧ｯ繧､繧ｺ螳御ｺ・屓謨ｰ繧貞叙蠕・
  Future<int> getQuizCompletionCount() async {
    await _ensureInitialized();
    return _prefs!.getInt('quizCompletionCount') ?? 0;
  }

  // 繧ｯ繧､繧ｺ螳御ｺ・屓謨ｰ繧貞｢励ｄ縺・
  Future<void> incrementQuizCompletionCount() async {
    await _ensureInitialized();
    final currentCount = await getQuizCompletionCount();
    await _prefs!.setInt('quizCompletionCount', currentCount + 1);
  }

  // 譛蠕後↓繝ｬ繝薙Η繝ｼ繧定｡ｨ遉ｺ縺励◆譌･譎ゅｒ蜿門ｾ・
  Future<DateTime?> getLastReviewRequestDate() async {
    await _ensureInitialized();
    final timestamp = _prefs!.getInt('lastReviewRequestTimestamp');
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  // 譛蠕後↓繝ｬ繝薙Η繝ｼ繧定｡ｨ遉ｺ縺励◆譌･譎ゅｒ菫晏ｭ・
  Future<void> setLastReviewRequestDate(DateTime date) async {
    await _ensureInitialized();
    await _prefs!.setInt('lastReviewRequestTimestamp', date.millisecondsSinceEpoch);
  }

  // 蛻晏屓襍ｷ蜍墓律譎ゅｒ蜿門ｾ・
  Future<DateTime?> getFirstLaunchDate() async {
    await _ensureInitialized();
    final timestamp = _prefs!.getInt('firstLaunchTimestamp');
    if (timestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  // 蛻晏屓襍ｷ蜍墓律譎ゅｒ菫晏ｭ・
  Future<void> setFirstLaunchDate(DateTime date) async {
    await _ensureInitialized();
    if (await getFirstLaunchDate() == null) {
      await _prefs!.setInt('firstLaunchTimestamp', date.millisecondsSinceEpoch);
    }
  }

}