import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  Connectivity connectivity = Connectivity();
  bool hasConnection = false;
  ConnectivityResult? connectionMedium;
  StreamController<bool> connectionChangeController =
      StreamController.broadcast();

  Stream<bool> get connectionChange => connectionChangeController.stream;

  ConnectivityService() {
    checkInternetConnectivity();
  }

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return false;
    }
  }
}
