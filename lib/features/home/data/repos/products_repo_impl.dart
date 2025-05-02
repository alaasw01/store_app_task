import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app_task/features/home/data/data_source/remote_prodcuts_data_source.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/features/home/domain/repos/products_repo.dart';

import '../../../../utils/error/failure.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepoImpl(this.productsRemoteDataSource);

  @override
  Future<Either<Failure, Products>> fetchProdcuts(
      {String? search, num? limit, num? skip}) async {
    try {
      final Products? response = await productsRemoteDataSource.fetchProducts(
          search: search, limit: limit, skip: skip);
      if (response != null) {
        return right(response);
      }
      return left(
        ServerFailure.fromDiorError(
          DioException.badCertificate(requestOptions: RequestOptions()),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  //  @override
  // Future<Either<Failure, Products?>> getAllProducts() async {
  //   try {
  //     final Products? response = await productsRemoteDataSource.fetchProducts();
  //     if (response != null) {
  //       return right(response);
  //     }
  //     return left(
  //       ServerFailure.fromDiorError(
  //         DioException.badCertificate(requestOptions: RequestOptions()),
  //       ),
  //     );
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDiorError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}
