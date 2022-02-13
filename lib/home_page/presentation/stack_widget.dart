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
        body: SafeArea(child: Hero(tag: "1", child: Image.asset(logoImage))));
  }
}
