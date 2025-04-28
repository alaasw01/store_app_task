import 'package:dartz/dartz.dart';
import 'package:store_app_task/features/login/data/models/auth/auth.dart';
import 'package:store_app_task/utils/error/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, Auth?>> login({
    required String email,
    required String password,
  });
}
