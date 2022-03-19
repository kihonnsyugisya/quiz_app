
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quiz_app/utils/buttons.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'package:quiz_app/utils/package_info.dart';
import 'package:quiz_app/utils/shared_preference.dart';

import '../view/nav_page.dart';
import 'info.dart';

class Dialogs{
  static  successResultDialog(
      {required BuildContext context, required String text,required VoidCallback? onTap,required String btnText}){
    return CoolAlert.show(
        title: '正解',
        context: context,
        type: CoolAlertType.success,
        text: text,
        barrierDismissible: false,
        backgroundColor: OriginalThemeColor.white,
        confirmBtnColor: OriginalThemeColor.secondColor,
        confirmBtnText: btnText,
        confirmBtnTextStyle: OriginalThemeFont.quizFont,
        onConfirmBtnTap: onTap,
    );
  }
  static Future<dynamic> missResultDialog(
      {required BuildContext context,required String text,required VoidCallback? onTap,required String btnText}){
    return CoolAlert.show(
      title: '不正解',
      context: context,
      type: CoolAlertType.error,
      text: '正解 : $text',
      barrierDismissible: false,
      backgroundColor: OriginalThemeColor.white,
      confirmBtnColor: OriginalThemeColor.secondColor,
      confirmBtnText: btnText,
      confirmBtnTextStyle: OriginalThemeFont.quizFont,
      onConfirmBtnTap: onTap,
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
      return showAnimatedDialog(
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
                  onPress: (){
                    SharedPreference().setStatus();
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        },
        animationType: DialogTransitionType.slideFromBottomFade,
        duration: const Duration(seconds: 1),
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
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("リタイア"),
          content: const Text("リタイアしますか？"),
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
      animationType: DialogTransitionType.slideFromBottomFade,
      duration: const Duration(seconds: 1),
    );
  }
  static Future<dynamic> netWorkErrorDialog({
    required BuildContext context,
    required VoidCallback onPressed}){
    return showAnimatedDialog(
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
      animationType: DialogTransitionType.slideFromBottomFade,
      duration: const Duration(seconds: 1),
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