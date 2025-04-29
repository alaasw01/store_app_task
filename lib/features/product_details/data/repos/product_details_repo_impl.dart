import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app_task/features/product_details/data/data_sources/remote_product_details.dart';
import 'package:store_app_task/features/product_details/domain/repos/product_details.dart';

import '../../../../utils/error/failure.dart';
import '../../../home/data/model/products.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepoImpl({required this.productDetailsRemoteDataSource});

  @override
  Future<Either<Failure, Product?>> fetchProductDetails(
      {required num id}) async {
    try {
      final Product? response =
          await productDetailsRemoteDataSource.fetchProductDetails(id: id);
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
}
