part of '../presentation/view/login_view.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

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
}
