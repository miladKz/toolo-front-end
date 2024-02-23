import 'dart:html' as html;
import 'dart:io';

import 'package:flutter/services.dart';

void exitApp() {
  try {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    } else {
      html.window.close();
    }
  } catch (e) {
    e.toString();
  }
}
