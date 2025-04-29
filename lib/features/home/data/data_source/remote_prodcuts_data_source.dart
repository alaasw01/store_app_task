import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/utils/services/products_services.dart';

abstract class ProductsRemoteDataSource {
  Future<Products?> fetchProducts();
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  @override
  Future<Products?> fetchProducts() async {
    final products = await getProductsApi();

    if (products != null) {
      return products;
    } else {
      return null;
    }
  }
}
