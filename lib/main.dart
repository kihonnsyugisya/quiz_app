import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jujutsu_kaisen_quiz/utils/dialogs.dart';
import 'package:jujutsu_kaisen_quiz/utils/shared_preference.dart';
import 'package:jujutsu_kaisen_quiz/view/nav_page.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // 画面の向きを縦向き固定に設宁E
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // スチE�Eタスバ�Eを表示するように設宁E
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );
  await MobileAds.instance.initialize();
  await SharedPreference().init();
  // 初回起動日時を記録�E�まだ記録されてぁE��ぁE��合�Eみ�E�E
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
      title: '呪術クイズ',
      theme: ThemeData(
        // textTheme: OriginalThemeFont.mainTheme,
        primarySwatch: Colors.blue,
      ),
      home: const NavPage(),
    );
  }
}

// TODO: info.plistとアンドロイド�Eニフェスト�Eアプリのラベル名を替える
// TODO: info.plistとアンドロイド�Eニフェスト�E庁E��IDを書き換える