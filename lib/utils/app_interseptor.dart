// import 'dart:convert';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:store_app_task/contants/constants.dart';
import 'package:store_app_task/features/login/data/models/auth/auth.dart';
import 'package:store_app_task/utils/cache_helper.dart';
import 'package:store_app_task/utils/services/auth_services.dart';

class AppInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final String token = await getValidAppToken();
      options.headers.addAll({'Authorization': token});

      return super.onRequest(options, handler);
    } catch (_) {}
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.statusCode == 401) {
      await getValidAppToken();
    }
    super.onResponse(response, handler);
  }
}

Future<String> getValidAppToken() async {
  try {
    final String? token =
        await CacheHelper.readSecuredData(key: AppConstant.token);
    final String newToken = await _checkAppTokenValidation(token ?? '');
    return newToken.isNotEmpty ? newToken : token ?? '';
  } catch (ex) {
    return '';
  }
}

Future<String> _checkAppTokenValidation(String token) async {
  final bool isExpired = JwtDecoder.isExpired(token);

  if (isExpired) {
    final Auth? data = jsonDecode(
      CacheHelper.readSecuredData(key: AppConstant.token) as String,
    );

    if (data != null) {
      final Auth? user = await loginApi(
          email: CacheHelper.getSharedData(key: AppConstant.email),
          password: CacheHelper.getSharedData(key: AppConstant.password));
      if (user != null && user.token != null) {
        return user.token!;
      }
    }
    return '';
  } else {
    return token;
  }
}
