import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app_task/contants/end_points.dart';
import 'package:store_app_task/features/home/data/model/products.dart';

Future<Products?> getProductsApi(
    {String? search, num? limit, num? skip}) async {
  try {
    final Dio dio = Dio();
    final response = await dio.get(
        '${EndPoints.products}${search != null ? '/search?q=$search' : ''}${limit != null ? '${search != null ? '&' : '?'}limit=$limit' : ''}${skip != null ? '&skip=$skip' : ''}');

    if (response.statusCode == 200) {
      return Products.fromJson(response.data as Map<String, dynamic>);
    }
  } catch (ex) {
    debugPrint('Error fetching products: $ex');
  }
  return null;
}

Future<Product?> getProductDetailsApi({num? id}) async {
  try {
    final Dio dio = Dio();
    final response = await dio.get('${EndPoints.products}/$id');

    if (response.statusCode == 200) {
      return Product.fromJson(response.data as Map<String, dynamic>);
    }
  } catch (ex) {
    debugPrint('Error fetching products: $ex');
  }
  return null;
}
