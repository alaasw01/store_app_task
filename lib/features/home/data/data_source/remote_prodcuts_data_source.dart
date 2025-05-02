import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/utils/services/products_services.dart';

abstract class ProductsRemoteDataSource {
  Future<Products?> fetchProducts({String? search, num? limit, num? skip});
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  @override
  Future<Products?> fetchProducts(
      {String? search, num? limit, num? skip}) async {
    final products =
        await getProductsApi(search: search, limit: limit, skip: skip);

    if (products != null) {
      return products;
    } else {
      return null;
    }
  }
}
