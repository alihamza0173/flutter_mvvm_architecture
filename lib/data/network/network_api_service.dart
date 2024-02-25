import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_architecture/data/app_exceptions.dart';
import 'package:flutter_mvvm_architecture/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return jsonResponse;
  }

  @override
  Future getPostApiResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(Uri.parse(url), body: {});
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 404:
        throw UnauthorisedException(response.body);
      default:
        throw FetchDataException(
            'Error Occured While Communication with server with status code ${response.statusCode}');
    }
  }
}
