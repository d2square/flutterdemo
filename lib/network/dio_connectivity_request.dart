import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioConnectivityRequest {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequest({required this.dio, required this.connectivity});

  Future<Response> scheduleRegistry(RequestOptions requestOptions) async {
    StreamSubscription? streamSubscription;
    final responseCompleter = Completer<Response>();
    connectivity.onConnectivityChanged.listen(
      (event) {
        if (event != ConnectivityResult.none) {
          streamSubscription!.cancel();
          responseCompleter.complete(dio.request(
            requestOptions.path,
            cancelToken: requestOptions.cancelToken,
            data: requestOptions.data,
            onReceiveProgress: requestOptions.onReceiveProgress,
            onSendProgress: requestOptions.onSendProgress,
            queryParameters: requestOptions.queryParameters,
          ));
        }
      },
    );
    return responseCompleter.future;
  }
}
