import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:helloworld/network/exception.dart';

class ApiProvider {
  final client = Dio();

  Future<dynamic> get(String url, String baseUrl, var params) async {
    Response responseJson;
    try {
      final response = await client.get(baseUrl + url, queryParameters: params);
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
        print(responseJson);
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
}
