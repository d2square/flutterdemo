import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  int connectionType = 0;
  Connectivity connectivity = Connectivity();

  //Stream to keep listening to network change state
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    getConnectionType();
    _streamSubscription =
        connectivity.onConnectivityChanged.listen(_updateState);
    super.onInit();
  }

  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void> getConnectionType() async {
    var connectionResult;
    try {
      connectionResult = await (connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e);
    }
    return _updateState(connectionResult);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = 1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType = 2;
        update();
        break;
      case ConnectivityResult.none:
        connectionType = 0;
        update();
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription.cancel();
  }
}
