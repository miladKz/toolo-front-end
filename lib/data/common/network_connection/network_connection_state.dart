import 'package:flutter/widgets.dart';
import 'package:toolo_gostar/data/common/network_connection/http_client.dart';

bool isNetworkConnected = false;

class NetworkConnectionState {
  static final ValueNotifier<bool> networkConnectionStateNotifier =
      ValueNotifier<bool>(false);

  static void networkConnectionStateListener() {
    isNetworkConnected = networkConnectionStateNotifier.value;
    debugPrint('url: ${httpClient.options.baseUrl}');
  }
}
