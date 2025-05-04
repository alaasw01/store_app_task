import 'package:hive/hive.dart';
import 'package:store_app_task/contants/constants.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/features/home/domain/entities/products_entity.dart';
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
    // var productsBox = Hive.box<ProductEntity>(AppConstant.productsBox);

    if (products != null) {
      // for (var product in products.products ?? []) {
      //   if (!productsBox.containsKey(product.productId)) {
      //     productsBox.put(product.productId, product);
      //   }
      // }
      return products;
    } else {
      return null;
    }
  }
}
