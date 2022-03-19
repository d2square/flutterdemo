import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:helloworld/network/dio_connectivity_request.dart';

class RetryInterceptor extends Interceptor {
  final DioConnectivityRequest dioConnectivityRequest;

  RetryInterceptor({required this.dioConnectivityRequest});

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        return dioConnectivityRequest.scheduleRegistry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }
    return err;
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }
}
