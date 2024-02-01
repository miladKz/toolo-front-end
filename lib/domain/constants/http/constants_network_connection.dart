class ConstantsNetworkConnection {
  static const Map<String, dynamic> httpRequestDefHeaders = {
    'content-type': 'application/json;charset=utf-8',
    "Access-Control-Allow-Origin": "*",
    // Required for CORS support to work
    "Access-Control-Allow-Credentials": true,
    // Required for cookies, authorization headers with HTTPS
  };
}
