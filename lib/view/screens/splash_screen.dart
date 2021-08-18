import 'dart:async';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import 'package:easy_learn/view/screens/list_contents.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  loadSplash() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.pushReplacement(context, PageTransition(
        type: PageTransitionType.fade,
        child: ListContents()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blueAccent
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_logo.png'),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text("Easy Learn 👩‍🏫", style: TextStyle(fontSize: 40),)
            )
          ],
        ),
      ),
    );
  }
}