import 'package:get/get.dart';
import 'package:helloworld/home_page/applications/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
  }
}
