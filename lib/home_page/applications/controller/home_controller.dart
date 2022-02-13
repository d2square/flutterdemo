import 'package:get/get.dart';

class HomeController extends GetxController {
  ///we can write logical part in the controller
  ///
  ///
  /// Using obx
  RxString s = "Ravi".obs;

  updateString(String valueUpdate) {
    s.value = valueUpdate;
  }

  ///using GetBuilder

  List<String> strList = ["Abhi", "Sarika", "Ravindra"];
  String valueForAppBar = "Sarika";

  updateSarikaValue(String string, int index) {
    strList[index] = string;
    update();
  }
}
