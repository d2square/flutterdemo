import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld/home_page/applications/controller/home_controller.dart';
import 'package:helloworld/home_page/presentation/drawer_menu.dart';
import 'package:helloworld/routes/app_pages.dart';
import 'package:helloworld/splashScreen/utils/const_string.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = new TextEditingController();
  String? userName;
  var home = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
        fontFamily: fontMontserrat, fontSize: 18, fontWeight: FontWeight.bold);
    var data = Get.arguments;
    return Scaffold(
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home", style: style),
      ),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              ///using controller
              //home.updateString("Gautam");
            },
            child: Hero(
              tag: "1",
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GetX<HomeController>(
                  //     builder: (homeController) {
                  //   return GestureDetector(
                  //       onTap: () {
                  //         homeController.stringValu.value = "Ravi";
                  //       },
                  //       child: Text(homeController.stringValu.value));
                  // }),

                  Obx(() {
                    return GestureDetector(
                        onTap: () {
                          home.stringValu.value = "Ravi";
                        },
                        child: Text(home.stringValu.value));
                  })

                  // GetBuilder<HomeController>(
                  //     builder: (controller) {
                  //   return GestureDetector(
                  //       onTap: () {
                  //         controller.updateValue("Ravi");
                  //       },
                  //       child: Text(controller.strValue));
                  // })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
