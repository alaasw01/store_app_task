class ProductEntity {
  final num? productId;
  final String? productTitle;
  final String? productDescription;
  final num? productPrice;
  final String? imageUrl;
  final String? productCategory;
  final num? productRating;
  final String? productBrand;
  final bool? isFavorite;
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
