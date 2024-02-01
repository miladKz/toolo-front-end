
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/constants/http/constants_network_connection.dart';

const jsonContentType = 'application/json;charset=utf-8';
const soapContentType = 'application/soap+xml;charset=utf-8';
final httpClient = Dio(BaseOptions(
  headers: ConstantsNetworkConnection.httpRequestDefHeaders,
  baseUrl: 'https://example.com',
  contentType: jsonContentType,
  connectTimeout: const Duration(seconds: 30),
  responseType: ResponseType.plain,
));

class HttpClient {
  static final ValueNotifier<String> urlNotifier = ValueNotifier<String>('');
  static void urlListener() {
    httpClient.interceptors.add(LogInterceptor(responseBody: true));
    httpClient.options.baseUrl = urlNotifier.value;
    debugPrint('url: ${httpClient.options.baseUrl}');
  }

  static void setContentType({String contentType=jsonContentType}){
    httpClient.options.contentType = contentType;
  }  
  static void setMethodType({String contentType=jsonContentType}){
    httpClient.options.contentType = contentType;
  }
} 