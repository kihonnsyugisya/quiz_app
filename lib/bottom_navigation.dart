
import 'package:flutter/material.dart';

class BottomNavigation{
  static int selectIndex = 0;
  static void onSelect(int index){
    selectIndex = index;
  }
  static List<Widget> widgetPages = [
    const Text('1'),
    const Text('2'),
  ];
  static BottomNavigationBar bottomItems(function){
    return BottomNavigationBar(
      items:  const [
        BottomNavigationBarItem(icon: Icon(Icons.quiz),label: 'クイズ'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined),label: 'その他'),
      ],
      currentIndex: selectIndex,
      onTap: function,
    );
  }

}