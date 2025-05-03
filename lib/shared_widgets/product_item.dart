import 'package:flutter/material.dart';
import 'package:store_app_task/features/home/domain/entities/products_entity.dart';
import 'package:store_app_task/utils/store_app.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.onFavoriteTap,
    this.onDetailsTap,
    this.product,
    this.tag,
    this.isFavorite,
  });
  final void Function()? onFavoriteTap;
  final void Function()? onDetailsTap;
  final ProductEntity? product;
  final num? tag;
  final bool? isFavorite;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  offset: const Offset(0, 3),
                  blurRadius: 4,
                  spreadRadius: 3,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onDetailsTap,
                child: Center(
                  child: product?.imageUrl != null
                      ? Hero(
                          tag: tag!,
                          child: CachedNetworkImage(
                            imageUrl: product!.imageUrl!,
                            height: 120,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  color: AppColors.orangeColor,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        )
                      : Image.asset(
                          AppImages.product,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product?.productTitle ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppStyles.textStyle14.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product?.productPrice ?? 0} EGP',
                    style: AppStyles.textStyle14.copyWith(
                      color: AppColors.orangeColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${product?.productRating ?? 0}',
                        style: AppStyles.textStyle14.copyWith(
                          color: AppColors.orangeColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber[400],
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: onFavoriteTap,
            child: Icon(
              isFavorite == true ? Icons.favorite : Icons.favorite_border,
              size: 25,
              color: AppColors.orangeColor,
            ),
          ),
        ),
        Positioned(
            left: 6,
            top: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                product?.productCategory ?? '',
                style: AppStyles.textStyle14.copyWith(
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
