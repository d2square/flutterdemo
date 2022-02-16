import 'package:get/get.dart';
import 'package:helloworld/sign_up/application/controller/signup_controller.dart';

class SignUpBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SignUpController>(SignUpController());
  }
}
