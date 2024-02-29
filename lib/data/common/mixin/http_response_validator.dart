import 'dart:convert';

import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:dio/dio.dart';
import 'package:toolo_gostar/app_exception.dart';

mixin HttpResponseValidator {
  Map<String, dynamic> validateResponse(Response response) {
    Map<String, dynamic> resultAsMap;
    if (response.statusCode != 200) {
      throw AppException(message: response.statusCode.toString());
    }
    String data = response.data;
    if (data.contains('{') || data.contains('[')) {
      try {
        resultAsMap = jsonDecode(data);
      } on FormatException {
        resultAsMap = {"data": data.charDecoder()};
      }
    } else {
      resultAsMap = {"data": data.charDecoder()};
    }

    return resultAsMap;
  }
}
