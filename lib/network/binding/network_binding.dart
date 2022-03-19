import 'package:get/get.dart';
import 'package:helloworld/network/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NetworkManager>(() => NetworkManager());
  }
}
