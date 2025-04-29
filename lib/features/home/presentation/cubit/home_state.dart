part of '../view/home_view.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailed extends HomeState {
  final String errorMessage;
  HomeFailed({required this.errorMessage});
}
