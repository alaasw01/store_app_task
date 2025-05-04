import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_app_task/contants/constants.dart';
import 'package:store_app_task/features/home/domain/entities/products_entity.dart';

abstract class ProductsLocalDataSource {
  List<ProductEntity> getFavoriteProducts();
  // List<Products>? getCachedProducts();
  void addFavorite(ProductEntity product);
  void removeFavorite(num id);
  bool isFavorite(num id);
}

class ProductsLocalDataSourceImpl extends ProductsLocalDataSource {
  var box = Hive.box<ProductEntity>(AppConstant.favoritesBox);

  @override
  List<ProductEntity> getFavoriteProducts() {
    return box.values.toList();
  }

  @override
  void addFavorite(ProductEntity product) {
    box.put(product.productId, product);
  }

  @override
  void removeFavorite(num id) {
    box.delete(id);
  }

  @override
  bool isFavorite(num id) {
    return box.containsKey(id);
  }

  // @override
  // List<Products> getCachedProducts() {
  //   var productsBox = Hive.box<Products>(AppConstant.productsBox);
  //   return productsBox.values.toList();
  // }
}
