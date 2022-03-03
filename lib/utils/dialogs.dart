
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/original_theme_font.dart';

class Dialogs{
  static  successResultDialog(
      {required BuildContext context, required String text,required VoidCallback? onTap}){
    return CoolAlert.show(
        title: '正解',
        context: context,
        type: CoolAlertType.success,
        text: text,
        barrierDismissible: false,
        backgroundColor: OriginalThemeColor.white,
        confirmBtnColor: OriginalThemeColor.themeColor,
        confirmBtnText: '次の問題',
        confirmBtnTextStyle: OriginalThemeFont.mainFont,
        onConfirmBtnTap: onTap,
    );
  }
  static Future<dynamic> missResultDialog(
      {required BuildContext context,required String text,required VoidCallback? onTap}){
    return CoolAlert.show(
      title: '不正解',
      context: context,
      type: CoolAlertType.error,
      text: '正解 : $text',
      barrierDismissible: false,
      backgroundColor: OriginalThemeColor.white,
      confirmBtnColor: OriginalThemeColor.themeColor,
      confirmBtnText: '次の問題',
      confirmBtnTextStyle: OriginalThemeFont.mainFont,
      onConfirmBtnTap: onTap,
    );
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
}