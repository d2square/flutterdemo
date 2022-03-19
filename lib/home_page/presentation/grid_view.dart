
import 'package:flutter/material.dart';

///state is not available
class NameList extends StatelessWidget {
  NameList({Key? key}) : super(key: key);
  List<Color> color = [
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.blue,
    Colors.orange
  ];
  List<String> strData=["Dipak","Sonawane","Mahesh","John","Roman"];

  void shoBottom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  Image(image: AssetImage("")),
                Expanded(flex: 2, child: Text("Hello BottomSheet")),
                SizedBox(
                  width: 10,
                ),
                Expanded(flex: 1, child: Text("Hello BottomSheet")),
                SizedBox(
                  width: 10,
                ),
                Expanded(flex: 1, child: Text("Hello BottomSheet")),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "Demo Name",
          style: TextStyle(
              locale: Locale('en'),
              fontSize: 20,
              letterSpacing: 3,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: [Icon(Icons.login)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History")
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
          child: Icon(Icons.add),
          onPressed: () {
            shoBottom(context);
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  children: List.generate(strData.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: color[index],
                              gradient: LinearGradient(
                                  end: Alignment.centerLeft,
                                  begin: Alignment.centerRight, colors: [
                                Colors.blue,
                                Colors.red,

                              ]

                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person),
                                  Text(strData[index]),
                                ],
                              ))),
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}

var dummyPersonList = List<Person>.generate(20, (i) {
  return Person(
    name: 'John Doe',
    avatarUrl: 'http://somewebsite.com/dummy_avatar.jpg',
  );
});

class Person {
  final String? name;
  final String? avatarUrl;

  Person({this.name, this.avatarUrl});
}
