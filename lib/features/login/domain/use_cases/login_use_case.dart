import 'package:dartz/dartz.dart';
import 'package:store_app_task/features/login/data/models/auth/auth.dart';
import 'package:store_app_task/features/login/domain/repos/login_repo.dart';
import 'package:store_app_task/utils/error/failure.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<Failure, Auth?>> call({
    required String email,
    required String password,
  }) async {
    return await loginRepo.login(email: email, password: password);
  }
}
