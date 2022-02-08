import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String? value = "";

  HomePage({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp)),
        title: Text("Hello World"),),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Column(
              children: const [
                Text("dajkkadklahsdkhkahsdhkkahshsjcndjkcksdnkcndksncnkdsncksdnkcnnsdkcnksdnckskdncskdkcksdnckskckcsncnkscn"),
                Text("dajkkadklahsdkhkahsdhkkahshsjcndjkcksdnkcndksncnkdsncksdnkcnnsdkcnksdnckskdncskdkcksdnckskckcsncnkscn"),
                Text("dajkkadklahsdkhkahsdhkkahshsjcndjkcksdnkcndksncnkdsncksdnkcnnsdkcnksdnckskdncskdkcksdnckskckcsncnkscn"),
                Text("dajkkadklahsdkhkahsdhkkahshsjcndjkcksdnkcndksncnkdsncksdnkcnnsdkcnksdnckskdncskdkcksdnckskckcsncnkscn"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
