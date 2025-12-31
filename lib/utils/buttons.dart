
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jujutsu_kaisen_quiz/utils/original_theme_font.dart';
import 'color/original_theme_color.dart';

class Buttons{
  static TextButton originalTextButton({
    required String text,
    required VoidCallback? onPress})
  {
    return TextButton(
        onPressed: onPress,
        style: ButtonStyle(overlayColor: WidgetStateProperty.all(OriginalThemeColor.transparent),),
        child: Text(
          text,
          style: OriginalThemeFont.subFont,
        ),
      // onFocusChange: ,
    );
  }

  static TextButton nextButton({
    required String text,
    required VoidCallback? onPress})
  {
    return TextButton(
      onPressed: onPress,
      style: ButtonStyle(overlayColor: WidgetStateProperty.all(OriginalThemeColor.transparent),),
      child: Text(
        text,
        style: OriginalThemeFont.quizFont,
      ),
      // onFocusChange: ,
    );
  }

  // ignore: non_constant_identifier_names
  static Widget ModeButton({
    required String buttonText,
    required VoidCallback? page,
    required Color? color})
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 54,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? OriginalThemeColor.buttonColor,
            foregroundColor: Colors.white,
          ),
          onPressed: page,
          child: Text(
            buttonText,
            style: OriginalThemeFont.modeFont
          ),
        ),
      ),
    );
  }
// TODO: 第3章以降を追加する場合は、適宜追加する。quizListに問題を追加した上で。
  // ※画面に表示されるボタンの数は、クイズリストの数に起因するようにしている。
  static List<dynamic> normalModeList = [
    ModeButtonEntity(buttonText: '前編', color: null),
    ModeButtonEntity(buttonText: '後編', color: null),
  ];

  static List<dynamic> hardModeList = [
    ModeButtonEntity(buttonText: '特級', color: null),

  ];

  static TextButton twitterButton({VoidCallback? onPressed}){
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(overlayColor: WidgetStateProperty.all(OriginalThemeColor.transparent),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(FontAwesomeIcons.twitter,size: 20),
          Text('シェアしてね！',style: OriginalThemeFont.moderateFont,),
        ],
      ),
    );
  }
  static TextButton revivalButton({VoidCallback? onPressed}){
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(overlayColor: WidgetStateProperty.all(OriginalThemeColor.transparent),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.live_tv_sharp,size: 20,color: OriginalThemeColor.white,),
          const SizedBox(width: 4,),
          Text('CMを見て復活する',style: OriginalThemeFont.moderateFont,),
        ],
      ),
    );
  }
}

class ModeButtonEntity{
  String buttonText;
  Color? color;
  ModeButtonEntity({
    required this.buttonText,
    required this.color,
  });
}

class MoreButton extends StatelessWidget {
  static List<Widget> list = [

  ];
  static Divider bottomLine = Divider(color: OriginalThemeColor.gray,height: 0.5,);
  final Text text;
  final GestureTapCallback? onTap;
  final Icon icon;
  MoreButton({Key? key, required this.text,required this.onTap,required this.icon,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 8,),
                text,
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}



