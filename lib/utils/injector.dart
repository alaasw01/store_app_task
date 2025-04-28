import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app_task/features/login/data/data_sources/remote_data_source.dart';
import 'package:store_app_task/features/login/data/repos/login_repo_impl.dart';
import 'package:store_app_task/utils/app_interseptor.dart';

final locator = GetIt.I;

Future<void> setupServiceLocator() async {
  _setupDio();

  locator.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      loginRemoteDataSource: LoginRemoteDataSourceImpl(),
    ),
  );
}

void _setupDio() {
  try {
    final dio = Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
        },
      ),
    );
    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(AppInterceptors());
    locator.registerLazySingleton(() => dio);
  } catch (e) {
    // optional: print error
  }
}
