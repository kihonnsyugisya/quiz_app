import 'package:flutter/material.dart';
import 'package:quiz_app/view/nav_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        // textTheme: OriginalThemeFont.mainTheme,
        primarySwatch: Colors.blue,
      ),
      home: const NavPage(),
    );
  }
}
