import 'package:store_app_task/features/home/domain/entities/products_entity.dart';

class Products {
  List<Product>? products;
  num? total;
  num? skip;
  num? limit;

  Products({this.products, this.total, this.skip, this.limit});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as num?,
        skip: json['skip'] as num?,
        limit: json['limit'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}

class Product extends ProductEntity {
  num? id;
  String? title;
  String? description;
  String? category;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  num? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  num? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  }) : super(
            productBrand: brand,
            productId: id,
            productTitle: title,
            productDescription: description,
            productPrice: price,
            imageUrl: thumbnail,
            productCategory: category,
            productRating: rating);

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as num?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        category: json['category'] as String?,
        price: json['price'] as num?,
        discountPercentage: json['discountPercentage'] as num?,
        rating: json['rating'] as num?,
        stock: json['stock'] as num?,
        tags:
            (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
        brand: json['brand'] as String?,
        sku: json['sku'] as String?,
        weight: json['weight'] as num?,
        dimensions: json['dimensions'] == null
            ? null
            : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
        warrantyInformation: json['warrantyInformation'] as String?,
        shippingInformation: json['shippingInformation'] as String?,
        availabilityStatus: json['availabilityStatus'] as String?,
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
        returnPolicy: json['returnPolicy'] as String?,
        minimumOrderQuantity: json['minimumOrderQuantity'] as num?,
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'tags': tags,
        'brand': brand,
        'sku': sku,
        'weight': weight,
        'dimensions': dimensions?.toJson(),
        'warrantyInformation': warrantyInformation,
        'shippingInformation': shippingInformation,
        'availabilityStatus': availabilityStatus,
        'reviews': reviews?.map((e) => e.toJson()).toList(),
        'returnPolicy': returnPolicy,
        'minimumOrderQuantity': minimumOrderQuantity,
        'meta': meta?.toJson(),
        'images': images,
        'thumbnail': thumbnail,
      };
}

class Dimensions {
  num? width;
  num? height;
  num? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json['width'] as num?,
        height: json['height'] as num?,
        depth: json['depth'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'width': width,
        'height': height,
        'depth': depth,
      };
}

class Review {
  num? rating;
  String? comment;
  DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json['rating'] as num?,
        comment: json['comment'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        reviewerName: json['reviewerName'] as String?,
        reviewerEmail: json['reviewerEmail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'comment': comment,
        'date': date?.toIso8601String(),
        'reviewerName': reviewerName,
        'reviewerEmail': reviewerEmail,
      };
}

class Meta {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        barcode: json['barcode'] as String?,
        qrCode: json['qrCode'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'barcode': barcode,
        'qrCode': qrCode,
      };
}
