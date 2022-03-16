
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:marquee/marquee.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/dialogs.dart';
import 'package:quiz_app/utils/shared_preference.dart';
import '../utils/adMob.dart';
import '../utils/info.dart';
import '../utils/navigation.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  void _onItemTapped(int index){
    setState(() {
      Navigation.selectIndex = index;
    });
  }

  @override
  void dispose(){
    // TODO: implement dispose
    AdMob.myBanner().dispose();
    print('バナーを破棄しました');
    super.dispose();
  }

  @override
  void initState() {
    Future(() async {
      await SharedPreference().getStatus;
      // await AdMob.myBanner(adType: 'banner').load();
      // TODO: ダイアログをテスト表示したい場合は下記を解除
      // SharedPreference().getRestStatus();
      if(Info.isShowInfoDialog()){
        SchedulerBinding.instance!.addPostFrameCallback((_) => Dialogs.infoDialog(context));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: OriginalThemeColor.themeColor,
        body: Column(
          children: [
            Container(
              child: Center(
                  child: Marquee(
                    text: Info.information,
                    style: TextStyle(color: OriginalThemeColor.white),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 30.0,
                    startPadding: 10.0,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  )
              ),
              color: OriginalThemeColor.black,
              height: 24,
            ),
            Expanded(flex:9,child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: SizedBox(
                        // color: OriginalThemeColor.gray,
                        height: deviceWidth * 0.4,
                        width: deviceWidth * 0.4,
                        child: Image.asset(
                          // TODO: ロゴイメージの差し替え（ファイル名はそのままが望ましい。サイズは600＊600のpng）
                          'images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Navigation.widgetPages.elementAt(Navigation.selectIndex),
                  ],
                ),
              ),
            )),
            // TODO: モードが四つ以上になる場合は、削除すること
            Expanded(flex:1,child: AdMob.bannerAdArea(child: AdWidget(ad: AdMob.myBanner()))),
          ],
        ),
        bottomNavigationBar: Navigation.bottomItems(_onItemTapped),
      ),
    );
  }
}
