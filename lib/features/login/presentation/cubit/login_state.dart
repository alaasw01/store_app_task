part of '../view/login_view.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String? token;

  LoginSuccess({required this.token});
}

final class LoginFailed extends LoginState {
  final String? errorMessage;

  LoginFailed({required this.errorMessage});
}
