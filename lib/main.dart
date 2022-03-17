import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quiz_app/utils/dialogs.dart';
import 'package:quiz_app/utils/shared_preference.dart';
import 'package:quiz_app/view/nav_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
    WidgetsBinding.instance?.addPostFrameCallback((_) => Dialogs.attDialog());

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
      home: const NavPage(),
    );
  }
}

// TODO: info.plistとアンドロイドマニフェストのアプリのラベル名を替える