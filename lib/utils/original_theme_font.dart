
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jujutsu_kaisen_quiz/utils/color/original_theme_color.dart';

class OriginalThemeFont{
//  クイズのフォント（日本語）
  static TextStyle quizFont = GoogleFonts.notoSerifJp(textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white));
//  太めの日本語
  static TextStyle basicFont = GoogleFonts.notoSerifJp(textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white));

  static TextStyle subFont = GoogleFonts.cinzel(textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: OriginalThemeColor.white));

//  ミニ英語表記（Versionで使った）
  static TextStyle miniFont = GoogleFonts.cinzel(textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: OriginalThemeColor.white));

//  第何問目かの見出し
  static TextStyle titleFont = GoogleFonts.cinzel(textStyle: const TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Colors.white));

  //  モードボタンのフォント
  static TextStyle modeFont = GoogleFonts.cinzel(textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white));

//  結果ページの正解数
  static TextStyle accentFont = GoogleFonts.cinzel(textStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: OriginalThemeColor.white));

  static TextStyle moderateFont = GoogleFonts.notoSerifJp(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: OriginalThemeColor.white));

}
