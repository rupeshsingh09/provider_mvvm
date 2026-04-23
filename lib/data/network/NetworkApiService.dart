import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider_mvvm/data/app_excaptions.dart';
import 'package:provider_mvvm/data/network/BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      // fetchdataexception exception ko call kiye h jo api_exception.dart me code kiye h
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      // fetchdataexception exception ko call kiye h jo api_exception.dart me code kiye h
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response) {
      // api k response 200 aayega tb
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      // api k response 400 aayega tb

      case 400:
        // badrequestException exception ko call kiye h
        throw BadRequestException(response.body.toString());

      case 500:
      case 404:
        // UnauthorisedException exception ko call kiye h
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
          'Error accourded while communicatting with server' +
              'with statuss code' +
              response.statusCode.toString(),
        );
    }
  }
}
