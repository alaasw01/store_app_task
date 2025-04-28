import 'package:store_app_task/features/login/data/models/auth/auth.dart';
import 'package:store_app_task/utils/services/auth_services.dart';

abstract class LoginRemoteDataSource {
  Future<Auth?> login({
    required String email,
    required String password,
  });
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<Auth?> login({
    required String email,
    required String password,
  }) async {
    final response = await loginApi(email: email, password: password);
    return response;
  }
}
