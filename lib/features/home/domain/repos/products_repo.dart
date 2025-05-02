import 'package:dartz/dartz.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/utils/error/failure.dart';

abstract class ProductsRepo {
  Future<Either<Failure, Products?>> fetchProdcuts(
      {String? search, num? limit, num? skip});
}
