import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:helloworld/network/dio_connectivity_request.dart';
import 'package:helloworld/network/exception.dart';
import 'package:helloworld/network/retry_interceptor.dart';

class ApiProvider {
  static final options = BaseOptions(
    responseType: ResponseType.json,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static Dio initDio() {
    return Dio(options);
  }

  static final client = initDio();
  static final dioRequest = addInterceptor(client);

  Future<dynamic> getCall(String url, String baseUrl, var params) async {
    Response responseJson;
    try {
      final response =
          await dioRequest.get(baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postCall(String url, String baseUrl, var params) async {
    Response responseJson;
    try {
      final response = await dioRequest.post(baseUrl + url, data: params);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.data.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:

      default:
        throw FetchDataException('Server Error : ${response.statusCode}');
    }
  }

  static addInterceptor(Dio dioNet) {
    dioNet.interceptors.add(RetryInterceptor(
        dioConnectivityRequest:
            DioConnectivityRequest(connectivity: Connectivity(), dio: Dio())));
  }
}
