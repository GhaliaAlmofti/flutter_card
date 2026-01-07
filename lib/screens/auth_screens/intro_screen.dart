import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:saees_cards/helpers/consts.dart';
import 'package:saees_cards/screens/auth_screens/login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      PageViewModel(
        title: "Title of custom button page",
        body: "This is a description on a page with a custom button below.",
        image: Image.asset("assets/hand.png", height: 175.0),
      ),
      PageViewModel(
        title: "Title of custom button page",
        body: "This is a description on a page with a custom button below.",
        image: Image.asset("assets/cashRoll.png", height: 175.0),
      ),
      PageViewModel(
        title: "Title of custom button page",
        body: "This is a description on a page with a custom button below.",
        image: Image.asset("assets/cashier.png", height: 175.0),
      ),
    ];
    return IntroductionScreen(
      skipStyle: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(primaryColor),
      ),
      showSkipButton: true,
      doneStyle: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(primaryColor),
      ),

      dotsDecorator: DotsDecorator(
        activeColor: primaryColor,

        color: primaryColor.withValues(alpha: 0.5),
      ),

      pages: pages,
      showNextButton: false,

      skip: const Text("Skip"),
      onSkip: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => LoginScreen()),
        );
      },
      done: const Text("Done"),
      onDone: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
  }
}
