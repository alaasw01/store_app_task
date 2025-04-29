import 'package:dartz/dartz.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/features/home/domain/repos/products_repo.dart';
import 'package:store_app_task/utils/error/failure.dart';

class ProdcutsUseCase {
  final ProductsRepo productsRepo;

  ProdcutsUseCase(this.productsRepo);

  Future<Either<Failure, Products?>> call() async {
    return await productsRepo.fetchProdcuts();
  }
}
