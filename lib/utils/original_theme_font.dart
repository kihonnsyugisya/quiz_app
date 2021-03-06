
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';

// TODO: フォントを変更する。
class OriginalThemeFont{
//  クイズのフォント
  static TextStyle quizFont = const TextStyle(fontSize: 18,fontWeight: FontWeight.w200,fontFamily: 'Hiragino Kaku Gothic ProN');
//  太めの日本語
  static TextStyle basicFont = const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Hiragino Kaku Gothic ProN');

  static TextStyle subFont = GoogleFonts.oswald(textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: OriginalThemeColor.black));

//  ミニ英語表記（versionで使った）
  static TextStyle miniFont = GoogleFonts.oswald(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: OriginalThemeColor.black));

//  第何問目かのやつ
  static TextStyle titleFont = GoogleFonts.oswald(textStyle: const TextStyle(fontSize: 24,fontWeight: FontWeight.w500));

  //  モードボタンのフォント
  static TextStyle modeFont = GoogleFonts.oswald(textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500));

//  結果ページの正解数
  static TextStyle accentFont = GoogleFonts.oswald(textStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: OriginalThemeColor.black));

  static TextStyle moderateFont = TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontFamily: 'Hiragino Kaku Gothic ProN',color: OriginalThemeColor.black);

}