import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app_task/features/login/data/data_sources/remote_data_source.dart';
import 'package:store_app_task/features/login/data/models/auth/auth.dart';
import 'package:store_app_task/features/login/domain/repos/login_repo.dart';
import 'package:store_app_task/utils/error/failure.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, Auth?>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Auth? response = await loginRemoteDataSource.login(
        email: email,
        password: password,
      );
      if (response != null) {
        return right(response);
      }
      return left(
        ServerFailure.fromDiorError(
          DioException.badCertificate(requestOptions: RequestOptions()),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
