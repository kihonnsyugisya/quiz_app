import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quiz_app/utils/dialogs.dart';
import 'package:quiz_app/utils/shared_preference.dart';
import 'package:quiz_app/view/nav_page.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // 画面の向きを縦向き固定に設定
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // ステータスバーを表示するように設定
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );
  await MobileAds.instance.initialize();
  await SharedPreference().init();
  // 初回起動日時を記録（まだ記録されていない場合のみ）
  final sharedPref = SharedPreference();
  if (await sharedPref.getFirstLaunchDate() == null) {
    await sharedPref.setFirstLaunchDate(DateTime.now());
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    Future(() async {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      if(status == TrackingStatus.notDetermined){
        Dialogs.attDialog();
      }else{
        FlutterNativeSplash.remove();
      }
    });
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // TODO: アプリ名を変更する
      title: 'Quiz App',
      theme: ThemeData(
        // textTheme: OriginalThemeFont.mainTheme,
        primarySwatch: Colors.blue,
      ),
      home: const NavPage(),
    );
  }
}

// TODO: info.plistとアンドロイドマニフェストのアプリのラベル名を替える
// TODO: info.plistとアンドロイドマニフェストの広告IDを書き換える