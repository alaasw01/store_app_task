import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/utils/services/products_services.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<Product?> fetchProductDetails({required num id});
}

class ProductDetailsRemoteDataSourceImpl
    extends ProductDetailsRemoteDataSource {
  @override
  Future<Product?> fetchProductDetails({required num id}) async {
    final product = await getProductDetailsApi(id: id);

    if (product != null) {
      return product;
    } else {
      return null;
    }
  }
}
