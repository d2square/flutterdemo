import 'dart:async';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    usingStreams();
  }

  getTime() async {
    print("awaited time is ${DateTime.now()}");
    final time = await Future.delayed(Duration(seconds: 2))
        .then((value) => DateTime.now());
    print("awaited time is $time");
  }

  usingStreams() async {
    final streamController = StreamController<DateTime>();
    final unSubscribeStream = DateTime.now().add(Duration(seconds: 10));
    StreamSubscription<DateTime>? subscription;

    var timer = Timer.periodic(Duration(seconds: 2), (timer) {
      streamController.add(DateTime.now());

      if (DateTime.now().second % 3 == 0) {
        streamController.addError(() => Exception("Seconds divisible by 3"));
      }
    });
    subscription = streamController.stream.listen((event) async {
      print(event);
      if (event.isAfter(unSubscribeStream)) {
        print("Its after${unSubscribeStream},cleaning");
        timer.cancel();
        await streamController.close();
        await subscription?.cancel();
      }
    }, onError: (error, stack) {
      print("Divisible by three");
      print("the stream contains error${stack}");
    }, onDone: () {
      print("the stream done");
    });

  }

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
            child: RefreshIndicator(
              onRefresh: () {
                return home.getNewsDataFromApi();
              },
              child: Hero(
                tag: "1",
                child: GetBuilder<HomeController>(builder: (controller) {
                  return Column(
                    children: [
                      Expanded(
                        child: controller.noInternet == true
                            ? Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/internet.gif"),
                                    InkWell(
                                        onTap: () {
                                          home.getNewsDataFromApi();
                                        },
                                        child: const Icon(
                                          Icons.refresh,
                                          size: 50,
                                        ))
                                  ],
                                ),
                              )
                            : controller.loading == true
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    itemCount:
                                        controller.articleModelList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (con, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.updateSarikaValue(
                                              "Gautam", index);
                                        },
                                        child: Card(
                                          elevation: 5.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  controller
                                                          .articleModelList[
                                                              index]
                                                          .urlToImage ??
                                                      "",
                                                  height: 100,
                                                  width: 100,
                                                ),
                                                Text(
                                                  controller
                                                          .articleModelList[
                                                              index]
                                                          .author ??
                                                      "",
                                                  style: style,
                                                ),
                                                Text(
                                                  controller
                                                          .articleModelList[
                                                              index]
                                                          .title ??
                                                      "",
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
      ),
    );
  }
}
