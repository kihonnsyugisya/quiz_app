
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'color/original_theme_color.dart';

class Buttons{
  static TextButton originalTextButton({
    required String text,
    required VoidCallback? onPress})
  {
    return TextButton(
        onPressed: onPress,
        style: ButtonStyle(overlayColor: MaterialStateProperty.all(OriginalThemeColor.transparent),),
        child: Text(
          text,
          style: OriginalThemeFont.subFont,
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
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 54,
        child: ElevatedButton(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: color ?? OriginalThemeColor.themeSubColor,
            onPrimary: Colors.black,
          ),
          onPressed: page,
        ),
      ),
    );
  }

  // ※画面に表示されるボタンの数は、クイズリストの数に起因するようにしている。
  static List<dynamic> modeList = [
    ModeButtonEntity(buttonText: '第1章', color: null),
    ModeButtonEntity(buttonText: '第2章', color: null),
    ModeButtonEntity(buttonText: '第3章', color: null),
  ];
  static TextButton twitterButton({VoidCallback? onPressed}){
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(FontAwesomeIcons.twitter,size: 20),
          Text('シェアしてね！',style: OriginalThemeFont.moderateFont,),
        ],
      ),
      onPressed: onPressed,
      style: ButtonStyle(overlayColor: MaterialStateProperty.all(OriginalThemeColor.transparent),),
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
  static Divider bottomLine = Divider(color: OriginalThemeColor.black,height: 0.5,);
  final Text text;
  final GestureTapCallback? onTap;
  final Icon icon;
  MoreButton({Key? key, required this.text,required this.onTap,required this.icon,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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




