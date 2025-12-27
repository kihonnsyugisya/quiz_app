
import 'package:animate_do/animate_do.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jujutsu_kaisen_quiz/utils/buttons.dart';
import 'package:jujutsu_kaisen_quiz/utils/color/original_theme_color.dart';
import 'package:jujutsu_kaisen_quiz/utils/original_theme_font.dart';
import 'package:jujutsu_kaisen_quiz/utils/package_info.dart';
import 'package:jujutsu_kaisen_quiz/utils/shared_preference.dart';

import '../view/nav_page.dart';
import 'info.dart';

class Dialogs{
  static Future<dynamic> successResultDialog(
      {required BuildContext context, required String text,required VoidCallback? onTap,required String btnText}){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FadeIn(
          duration: const Duration(milliseconds: 300),
          child: ElasticIn(
            duration: const Duration(milliseconds: 400),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: OriginalThemeColor.white,
              contentPadding: const EdgeInsets.all(24),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElasticIn(
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        size: 60,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '正解！',
                    style: OriginalThemeFont.basicFont.copyWith(
                      fontSize: 24,
                      color: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    text,
                    style: OriginalThemeFont.quizFont.copyWith(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onTap,
                      child: Text(
                        btnText,
                        style: OriginalThemeFont.basicFont.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  static Future<dynamic> missResultDialog(
      {required BuildContext context,required String text,required VoidCallback? onTap,required String btnText}){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FadeIn(
          duration: const Duration(milliseconds: 300),
          child: ElasticIn(
            duration: const Duration(milliseconds: 400),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: OriginalThemeColor.white,
              contentPadding: const EdgeInsets.all(24),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElasticIn(
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.cancel,
                        size: 60,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '不正解',
                    style: OriginalThemeFont.basicFont.copyWith(
                      fontSize: 24,
                      color: Colors.red.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '正解は',
                    style: OriginalThemeFont.quizFont.copyWith(
                      fontSize: 14,
                      color: OriginalThemeColor.gray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    text,
                    style: OriginalThemeFont.quizFont.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onTap,
                      child: Text(
                        btnText,
                        style: OriginalThemeFont.basicFont.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  static String confirmBtnText(bool isMoveToResultPage){
    if(isMoveToResultPage){
      return '結果へ';
    } else{
      return '次の問題';
    }
  }
  static Future<dynamic> infoDialog(BuildContext context)async{
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if(status != TrackingStatus.notDetermined){
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('お知らせ'),
            content: Text(Info.getPr()),
            actions: <Widget>[
              // ボタン領域
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Buttons.nextButton(
                  text: '閉じる',
                  onPress: () async {
                    final sharedPref = SharedPreference();
                    final currentVersion = PackageInfo.version;
                    await sharedPref.setStatus(); // 現在のバージョンを保存
                    await sharedPref.setLastShownPrVersion(currentVersion); // 表示したPRのバージョンを保存
                    // メッセージ内容のハッシュ値も保存（内容更新忘れの安全策！）
                    final prHash = Info.calculatePrHash(currentVersion);
                    await sharedPref.setLastShownPrHash(prHash);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        },
      );
    }
  }
  static void licenseDialog(BuildContext context){
    return showLicensePage(
      context: context,
      applicationName: PackageInfo.title,
      applicationVersion: PackageInfo.version,
    );
  }
  static Future<dynamic> retireDialog(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("離脱"),
            content: const Text("離脱しますか？"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text("キャンセル"),
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavPage()))
              ,
            ),
          ],
        );
      },
    );
  }
  static Future<dynamic> netWorkErrorDialog({
    required BuildContext context,
    required VoidCallback onPressed}){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("ネットワークエラー"),
          content: const Text("通信状況をご確認ください。"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: onPressed
              ,
            ),
          ],
        );
      },
    );
  }
  static Future<bool> isTrackingNotDetermined()async{
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if(status == TrackingStatus.notDetermined){
      return true;
    }else{
      return false;
    }
  }
  static Future<dynamic> attDialog()async{
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
        //ダイアログ表示
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
    FlutterNativeSplash.remove();
    // ignore: avoid_print
    print('このデバイスのuuid = $uuid');
  }
}
