import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld/home_page/domain/drawer_model.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<DrawerModel> drawerList = [
    DrawerModel(name: "Home", icon: Icons.home),
    DrawerModel(name: "Settings", icon: Icons.settings),
    DrawerModel(name: "Print", icon: Icons.print),
    DrawerModel(name: "Logout", icon: Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: Get.width,
            child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  children: [
                    Icon(Icons.supervised_user_circle),
                    Text("Dipak"),
                  ],
                )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: drawerList.length,
                shrinkWrap: true,
                itemBuilder: (c, index) {
                  return _createDrawerMenu(
                      icon: drawerList[index].icon,
                      strmenu: drawerList[index].name);
                }),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.facebook),
                Icon(Icons.facebook),
                Icon(Icons.facebook),
                Icon(Icons.facebook),
                Icon(Icons.facebook),
                Icon(Icons.facebook),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _createDrawerMenu({IconData? icon, String? strmenu}) {
    return ListTile(
      title: Row(
        children: <Widget>[Icon(icon), Text(strmenu!)],
      ),
    );
  }
}
