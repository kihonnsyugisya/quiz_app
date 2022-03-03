
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/dialogs.dart';
import '../utils/ad.dart';
import '../utils/bottom_navigation.dart';

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
    // TODO: implement initState
    SchedulerBinding.instance!.addPostFrameCallback((_) => Dialogs.infoDialog(context));
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
