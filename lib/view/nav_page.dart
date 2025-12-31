
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:marquee/marquee.dart';
import 'package:jujutsu_kaisen_quiz/utils/color/original_theme_color.dart';
import 'package:jujutsu_kaisen_quiz/utils/shared_preference.dart';
import '../utils/adMob.dart';
import '../utils/info.dart';
import '../utils/navigation.dart';

class NavPage extends StatefulWidget {
  final bool? isPerfect;
  const NavPage({Key? key, this.isPerfect}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  BannerAd? _bannerAd;
  late String _currentQuote; // 表示する名言

  void _onItemTapped(int index){
    setState(() {
      Navigation.selectIndex = index;
    });
  }

  @override
  void dispose(){
    // バナー広告を破棄
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // 常に出題範囲のアナウンスを表示（説明口調）
    _currentQuote = '出題範囲：前編は原作143話〜158話、後編は原作159話〜212話、特級は原作143話〜212話を出題範囲としています。';
    Future(() async {
      await SharedPreference().getStatus();
      // await AdMob.myBanner(adType: 'banner').load();
      // TODO: ダイアログをテスト表示したい場合は下記を解除
      // SharedPreference().getRestStatus();
      // アップデートのお知らせダイアログ（使用しないためコメントアウト）
      // if(await Info.isShowInfoDialog()){
      //   SchedulerBinding.instance.addPostFrameCallback((_) => Dialogs.infoDialog(context));
      // }
      // ハードモードで全問正解した場合にレビューを表示
      if(widget.isPerfect != null && widget.isPerfect == true){
        final InAppReview inAppReview = InAppReview.instance;
        if(await inAppReview.isAvailable()){
          await inAppReview.requestReview();
        }
      }
      // アダプティブバナー広告を読み込む
      if (mounted) {
        _bannerAd = await AdMob.createBannerAd(context);
        setState(() {});
      }
    });
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
                    text: _currentQuote,
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
              color: OriginalThemeColor.themeSubColor,
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
                          // TODO: ロゴイメージの差し替え（ファイル名はそのままが望ましい。サイズは600×600のpng）
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
            Expanded(
              flex:1,
              child: _bannerAd != null
                  ? AdMob.bannerAdArea(child: AdWidget(ad: _bannerAd!))
                  : AdMob.bannerAdArea(child: const SizedBox()), // 読み込み中は空のWidgetを表示
            ),
          ],
        ),
        bottomNavigationBar: Navigation.bottomItems(_onItemTapped),
      ),
    );
  }
}
