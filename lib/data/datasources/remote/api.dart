import 'package:dio/dio.dart';

import '../../../core/core.dart';

class Api {
  final myDio = createMyDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createMyDio() {
    var dio = Dio(BaseOptions(
      baseUrl: UrlUtils.baseUrl,
      headers: {
        "Accept": "application/json",
      },
      contentType: "application/json",
      receiveTimeout: const Duration(seconds: 30), // 15 seconds
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ));

    dio.options.contentType = Headers.formUrlEncodedContentType;
    // dio.interceptors.addAll({LogInterceptor()});
    return dio;
  }
}
