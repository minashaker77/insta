import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Spacer(),
          Expanded(
            child: Center(
              child: Image.asset(
                'images/logo.png',
                height: 200,
              ),
            ),
          ),
          Spacer(),
          Text(
            'From',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Text(
              'FACEBOOK',
              style: TextStyle(
                  fontSize: 50,
                  letterSpacing: 4.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradiant),
            ),
          ),
        ],
      ),
    ));
  }

  final Shader linearGradiant = const LinearGradient(colors: [
    Color(0xfffd9a1b),
    Color(0xfff26926),
    Color(0xffea1f0f),
    Color(0xffb8117b),
  ]).createShader(Rect.fromLTWH(50.0, 50.0, 200.0, 0.0));
}
