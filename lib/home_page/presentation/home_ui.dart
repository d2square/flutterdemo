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
        title: Obx(() {
          return Text(home.s.value, style: style);
        }),
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
              child: GetBuilder<HomeController>(builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.strList.length,
                          shrinkWrap: true,
                          itemBuilder: (con, index) {
                            return GestureDetector(
                              onTap: () {
                                home.updateSarikaValue("Gautam", index);
                              },
                              child: Card(
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        logoImage,
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text(
                                        controller.strList[index],
                                        style: style,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
