import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
        fontFamily: fontMontserrat, fontSize: 18, fontWeight: FontWeight.bold);
    var data = Get.arguments;
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Data", style: style),
      ),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.stackDemo);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Enter Name", hintText: "Type Here"),
                    onChanged: (val) {
                      setState(() {
                        userName = val;
                      });
                    },
                    controller: textEditingController,
                    keyboardType: TextInputType.text,
                  ),
                ),
                MaterialButton(
                    child: Text("Click Me"),
                    color: Colors.blue,
                    onPressed: () {
                      if (GetUtils.isNull(userName) ||
                          GetUtils.isNull(textEditingController.text)) {
                        print("Value is not empty");
                      }
                    }),
                Expanded(
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (con, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hell".toUpperCase(),
                                  style: style,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
