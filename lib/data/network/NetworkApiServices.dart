import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_apps/shared/shared.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_apps/data/app_exception.dart';
import 'package:flutter_apps/data/network/BaseApiServices.dart';

class NetworkApiServices implements BaseApiServices {
  @override
  Future getGetAPIResponse(String endpoint) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.https(Const.baseUrl, endpoint), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'key': Const.apiKey,
      });
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network request time out');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) {
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
