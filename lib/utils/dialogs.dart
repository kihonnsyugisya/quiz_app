
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'package:quiz_app/utils/package_info.dart';

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
  static Future<dynamic> infoDialog(BuildContext context){
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Title',
          contentText: 'content',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
          onNegativeClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.slideFromBottomFade,
      duration: const Duration(seconds: 1),
    );
  }
  static void licenseDialog(BuildContext context){
    return showLicensePage(
      context: context,
      applicationName: PackageInfo.title,
      applicationVersion: PackageInfo.version,
    );
  }
}