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
      var uri =
          baseUrl + url + ((params != null) ? queryParameters(params) : "");
      final response = await dioRequest.get(uri);
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

  Future<dynamic> uploadImage(File file, String baseUrl, url) async {
    Response responseJson;
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    final response = await dioRequest.post(baseUrl + url, data: formData);
    responseJson = _response(response);
    return responseJson;
  }

  Future<dynamic> sendFormFileCustom(
      String url, Map<String, dynamic> data, Map<String, File> files) async {
    Map<String, MultipartFile> fileMap = {};
    for (MapEntry fileEntry in files.entries) {
      File file = fileEntry.value;
      String fileName = file.path.split('/').last;
      fileMap[fileEntry.key] = MultipartFile(
          file.openRead(), await file.length(),
          filename: fileName);
    }
    data.addAll(fileMap);
    var formData = FormData.fromMap(data);
    return await dioRequest.post(url,
        data: formData, options: Options(contentType: 'multipart/form-data'));
  }

  String queryParameters(Map<String, String>? params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
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
