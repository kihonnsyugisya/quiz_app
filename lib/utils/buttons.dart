
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'color/original_theme_color.dart';

class Buttons{
  static TextButton originalTextButton({
    required String text,
    required VoidCallback? onPress})
  {
    return TextButton(
        onPressed: onPress,
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
}

class ModeButtonEntity{
  String buttonText;
  Color? color;
  ModeButtonEntity({
    required this.buttonText,
    required this.color,
  });
}

