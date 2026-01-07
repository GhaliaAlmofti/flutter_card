import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:saees_cards/helpers/functions_helper.dart';
import 'package:saees_cards/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Image.asset(
                  "assets/logoOnly.png",
                  width: getSize(context).width * 0.5,
                )
                .animate(
                  onComplete: (controller) {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(builder: (context) => ScreenRouter()),
                    );
                  },
                )
                .fadeIn(delay: 300.ms, duration: 600.milliseconds),
      ),
    );
  }
}
