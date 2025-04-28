import 'package:dio/dio.dart';
import 'package:store_app_task/contants/end_points.dart';
import 'package:store_app_task/features/login/data/models/auth/auth.dart';
// import 'package:store_app_task/utils/injector.dart' as injector;

Future<Auth?> loginApi(
    {required String email, required String password}) async {
  try {
    // final Dio dio = injector.locator<Dio>();
    final Dio dio = Dio();
    final response = await dio.post(EndPoints.login, data: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      return Auth.fromJson(response.data as Map<String, dynamic>);
    }
  } catch (ex) {
    return null;
  }
  return null;
}
