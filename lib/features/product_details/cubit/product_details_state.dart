part of '../presentation/view/product_details.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsChangeProductImage extends ProductDetailsState {}
