part of '../view/login_view.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  final FormGroup form = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(6)],
    ),
  });
  Map<String, String Function(Object)>? emailValidation = {
    ValidationMessage.required: (_) => 'Email is required',
    ValidationMessage.email: (_) => 'Must be a valid email',
  };
  Map<String, String Function(Object)>? passwordValidation = {
    ValidationMessage.required: (_) => 'Password is required',
    ValidationMessage.minLength: (_) => 'Must be at least 6 characters',
  };

  Future<void> login(BuildContext context) async {
    emit(LoginLoading());

    var result = await loginUseCase.call(
      email: form.control('email').value,
      password: form.control('password').value,
    );

    result.fold(
      (failure) {
        emit(LoginFailed(errorMessage: 'Login failed, please try again.'));
      },
      (auth) async {
        if (auth != null && auth.token != null) {
          await CacheHelper.saveSecuredData(
            key: AppConstant.token,
            value: auth.token,
          );

          await CacheHelper.saveSharedData(
            key: AppConstant.email,
            value: form.control('email').value,
          );
          await CacheHelper.saveSharedData(
            key: AppConstant.password,
            value: form.control('password').value,
          );

          // ignore: use_build_context_synchronously
          context.go(Routes.home);
          // var token = await CacheHelper.readSecuredData(key: AppConstant.token);
          // var email = CacheHelper.getDataString(key: AppConstant.email);
          // var password = CacheHelper.getDataString(key: AppConstant.password);
          // print(token);
          // print(email);
          // print(password);
          // emit(LoginSuccess(token: auth.token!));
        } else {
          emit(LoginFailed(errorMessage: 'Invalid login credentials.'));
        }
      },
    );
  }
}
