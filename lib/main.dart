import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quiz_app/utils/dialogs.dart';
import 'package:quiz_app/utils/quiz/quiz_list.dart';
import 'package:quiz_app/utils/shared_preference.dart';
import 'package:quiz_app/view/nav_page.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  MobileAds.instance.initialize();
  await SharedPreference().init();
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
    QuizList.firstHardList.addAll(QuizList.secondNormalList);
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
      title: 'Quiz App',
      theme: ThemeData(
        // textTheme: OriginalThemeFont.mainTheme,
        primarySwatch: Colors.blue,
      ),
      home: NavPage(),
    );
  }
}
