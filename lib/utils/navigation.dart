
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/view/home_page.dart';
import 'package:quiz_app/view/more_page.dart';

class Navigation{
  static int selectIndex = 0;
  static void onSelect(int index){
    selectIndex = index;
  }
  static List<Widget> widgetPages = [
    const HomePage(),
    const MorePage(),
  ];
  static BottomNavigationBar bottomItems(function){
    return BottomNavigationBar(
      // TODO: ボトムナビのカラーを決める
    backgroundColor: OriginalThemeColor.black,
      unselectedItemColor: OriginalThemeColor.gray,
      selectedItemColor: OriginalThemeColor.white,
      items: const[
        BottomNavigationBarItem(icon: Icon(Icons.quiz),label: 'クイズ',),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined),label: 'その他'),
      ],
      currentIndex: selectIndex,
      onTap: function,
    );
  }
}