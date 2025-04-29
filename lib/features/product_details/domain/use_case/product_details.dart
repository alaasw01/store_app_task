import 'package:dartz/dartz.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/features/product_details/domain/repos/product_details.dart';
import 'package:store_app_task/utils/error/failure.dart';

class ProdcutDetailsUseCase {
  final ProductDetailsRepo productDetailsRepo;

  ProdcutDetailsUseCase({required this.productDetailsRepo});

  Future<Either<Failure, Product?>> call({required num id}) async {
    return await productDetailsRepo.fetchProductDetails(id: id);
  }
}
