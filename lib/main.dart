import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld/routes/app_pages.dart';
import 'package:helloworld/splashScreen/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //defaultTransition: Transition.,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      //initialBinding: HomePageBinding(),
    );
  }
}
