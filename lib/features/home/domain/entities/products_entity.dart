import 'package:hive/hive.dart';
part 'products_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final num? productId;
  @HiveField(1)
  final String? productTitle;
  @HiveField(2)
  final String? productDescription;
  @HiveField(3)
  final num? productPrice;
  @HiveField(4)
  final String? imageUrl;
  @HiveField(5)
  final String? productCategory;
  @HiveField(6)
  final num? productRating;
  @HiveField(7)
  final String? productBrand;
  @HiveField(8)
  bool? isFavorite;

  ProductEntity({
    this.isFavorite,
    required this.productId,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
    required this.imageUrl,
    required this.productCategory,
    required this.productRating,
    required this.productBrand,
  });
}
