import 'dart:convert';

import 'package:flutter_mvvm_architecture/data/app_exceptions.dart';
import 'package:flutter_mvvm_architecture/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService implements BaseApiService {
  @override
  Future<Map<String, dynamic>> getGetApiResponse(String url) async {
    Map<String, dynamic> jsonResponse;
    try {
      final response = await http.get(Uri.parse(url));
      jsonResponse = returnResponse(response);
    } on http.ClientException {
      throw NoInternetException('No Internet Connection');
    }
    return jsonResponse;
  }

  @override
  Future<Map<String, dynamic>> getPostApiResponse(
      String url, dynamic data) async {
    Map<String, dynamic> jsonResponse;
    try {
      final response = await http.post(Uri.parse(url), body: data);
      jsonResponse = returnResponse(response);
    } on http.ClientException {
      throw NoInternetException('No Internet Connection');
    }
    return jsonResponse;
  }

  Map<String, dynamic> returnResponse(http.Response response) {
    final jsonResponse = jsonDecode(response.body);
    final error = jsonResponse['error'];
    switch (response.statusCode) {
      case 200:
        return jsonResponse;
      case 400:
        throw BadRequestException(error);
      case 404:
        throw UnauthorizedException(error);
      default:
        throw FetchDataException(
            'Error Occured While Communication with server with status code ${response.statusCode}');
    }
  }
}
