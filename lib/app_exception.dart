import 'package:flutter/material.dart';

class AppException {
  final String message;
  AppException({
   required this.message,
  }){
    debugPrint('AtrasProjectError= $message');
  }
}
