part of '../view/product_details.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailSuccess extends ProductDetailsState {}

final class ProductDetailsFailed extends ProductDetailsState {
  final String errorMessage;

  ProductDetailsFailed({required this.errorMessage});
}

final class ProductDetailsChangeProductImage extends ProductDetailsState {}
