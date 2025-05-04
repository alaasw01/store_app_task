import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app_task/features/home/data/data_source/local_products_data_source.dart';
import 'package:store_app_task/features/home/data/data_source/remote_prodcuts_data_source.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/features/home/domain/entities/products_entity.dart';
import 'package:store_app_task/features/home/domain/repos/products_repo.dart';

import '../../../../utils/error/failure.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ProductsRemoteDataSource productsRemoteDataSource;
  final ProductsLocalDataSource productsLocalDataSource;

  ProductsRepoImpl(this.productsRemoteDataSource, this.productsLocalDataSource);

  @override
  @override
  Future<Either<Failure, Products>> fetchProdcuts({
    String? search,
    num? limit,
    num? skip,
  }) async {
    try {
      final Products? response = await productsRemoteDataSource.fetchProducts(
        search: search,
        limit: limit,
        skip: skip,
      );

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

  addItemToFavorites(ProductEntity product) {
    productsLocalDataSource.addFavorite(product);
  }

  removeItemFromFavorites(num id) {
    productsLocalDataSource.removeFavorite(id);
  }

  List<ProductEntity> getFavoritesItem() {
    return productsLocalDataSource.getFavoriteProducts();
  }

  bool isFavorite(num id) {
    return productsLocalDataSource.isFavorite(id);
  }
}
