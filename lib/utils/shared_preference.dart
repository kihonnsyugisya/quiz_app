
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

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get getStatus {
    status = _prefs!.getString('status') ?? 0.toString();
    // ignore: avoid_print, unnecessary_brace_in_string_interps
    print('status = ${status}');
  }

  void setStatus() {
    _prefs!.setString('status', PackageInfo.version);
  }

  void getRestStatus() {
    status = 0.toString();
  }

}