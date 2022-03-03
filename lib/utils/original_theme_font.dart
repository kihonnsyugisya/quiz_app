
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';

class OriginalThemeFont{
//  クイズのフォント
  static TextStyle mainFont = const TextStyle(fontSize: 18,fontWeight: FontWeight.w200,fontFamily: 'Hiragino Kaku Gothic ProN');
  static TextStyle subFont = GoogleFonts.oswald(textStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: OriginalThemeColor.black));
//  第何問目かのやつ
  static TextStyle titleFont = GoogleFonts.oswald(textStyle: const TextStyle(fontSize: 24,fontWeight: FontWeight.w500));
}