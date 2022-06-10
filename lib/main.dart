import 'package:flutter/material.dart';
import 'package:mini_insta/main_page.dart';
import 'package:mini_insta/main_screen.dart';
import 'package:mini_insta/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      home: SplashScreen(),
    );
  }
}
