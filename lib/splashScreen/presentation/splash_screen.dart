import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld/home_page/presentation/home_ui.dart';
import 'package:helloworld/routes/app_pages.dart';
import 'package:helloworld/splashScreen/utils/const_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String manName = "Ravi";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Get.toNamed(Routes.home, arguments: 'Hello');
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              logo,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                manName = "Welcome to Flutter Demo";
                Get.changeTheme(ThemeData.dark());
              });
            },
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Hello world!',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 1000),
                ),
              ],
              totalRepeatCount: 4,
              onTap: () {
                setState(() {
                  Get.changeTheme(ThemeData.dark());
                });
              },
              pause: const Duration(milliseconds: 200),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
        ],
      ),
    ));
  }
}
