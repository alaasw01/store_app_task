import 'package:dartz/dartz.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/utils/error/failure.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, Product?>> fetchProductDetails({required num id});
}
