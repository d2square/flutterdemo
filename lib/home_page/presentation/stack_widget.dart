import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld/splashScreen/utils/const_string.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },

              ///if you want to use hoven on web only
              onHover: (val) {},
              child: const Icon(Icons.arrow_back)),
          title: const Text("Stack"),
          actions: const [InkWell(child: Icon(Icons.notification_important))],
        ),
        body: SafeArea(
            child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(color: Colors.green.shade400),
              gradient:
                  LinearGradient(begin: FractionalOffset(0.0, 3.5), stops: [
                0.8,
                1.0
              ], colors: [
                const Color(0xFF3366FF),
                const Color(0xFF00CCFF),
              ])),
        )));
  }
}
