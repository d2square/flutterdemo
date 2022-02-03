import 'package:flutter/material.dart';
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
    print("Hell Ravindra");
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
              logoImage,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),

          GestureDetector(
            onTap: () {
              setState(() {
                manName = "Hello Ravi";
              });
            },
            child: Text(
              manName,
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        ],
      ),
    ));
  }
}
