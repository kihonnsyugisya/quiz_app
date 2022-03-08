
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/dialogs.dart';
import 'package:quiz_app/utils/shared_preference.dart';
import '../utils/ad.dart';
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
  void initState() {
    Future(() async {
      await SharedPreference().getStatus;
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
                  child: Text(
                    // TODO: 適宜更新する。名言でもあり。
                    'info',
                    style: TextStyle(color: OriginalThemeColor.white),
                  )),
              color: OriginalThemeColor.black,
              height: 50,
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
            Expanded(flex:1,child: Ad.adArea),
          ],
        ),
        bottomNavigationBar: Navigation.bottomItems(_onItemTapped),
      ),
    );
  }
}
