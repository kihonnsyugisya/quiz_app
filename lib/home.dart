
import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _onItemTapped(int index){
    setState(() {
      BottomNavigation.selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigation.widgetPages.elementAt(BottomNavigation.selectIndex),
      bottomNavigationBar: BottomNavigation.bottomItems(_onItemTapped),
    );
  }
}
