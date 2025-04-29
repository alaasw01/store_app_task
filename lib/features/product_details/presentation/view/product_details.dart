import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/features/product_details/data/data_sources/remote_product_details.dart';
import 'package:store_app_task/features/product_details/data/repos/product_details_repo_impl.dart';
import 'package:store_app_task/features/product_details/domain/use_case/product_details.dart';
import 'package:store_app_task/utils/store_app.dart';
part '../cubit/product_details_cubit.dart';
part '../cubit/product_details_state.dart';
part 'widgets/product_images.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId});
  final num productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: GestureDetector(
          onTap: () => context.go(Routes.home),
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(ProdcutDetailsUseCase(
            productDetailsRepo: ProductDetailsRepoImpl(
                productDetailsRemoteDataSource:
                    ProductDetailsRemoteDataSourceImpl())))
          ..getProductDetails(id: productId),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Small product images (left side)
                      SizedBox(
                        width: 80,
                        height: 220,
                        child: ListView.builder(
                          itemCount: context
                              .read<ProductDetailsCubit>()
                              .productDetails
                              ?.images
                              ?.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => ProductImages(
                            imageUrl: context
                                    .read<ProductDetailsCubit>()
                                    .productDetails
                                    ?.images?[index] ??
                                '',
                            isSelected: index ==
                                    context
                                        .read<ProductDetailsCubit>()
                                        .selectedItem
                                ? true
                                : false,
                            onTap: () => context
                                .read<ProductDetailsCubit>()
                                .changeSelectedProductImage(index),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Main product image (right side)
                      Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: context
                                          .read<ProductDetailsCubit>()
                                          .productDetails
                                          ?.images
                                          ?.isNotEmpty ==
                                      true
                                  ? CachedNetworkImage(
                                      imageUrl: context
                                                  .read<ProductDetailsCubit>()
                                                  .productDetails
                                                  ?.images?[
                                              context
                                                  .read<ProductDetailsCubit>()
                                                  .selectedItem] ??
                                          '',
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.lightOrangeColor,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    )
                                  : Image.asset(
                                      AppImages.product,
                                      fit: BoxFit.contain,
                                      height: 170,
                                    ),
                            ),
                            const Positioned(
                              top: -15,
                              right: 10,
                              child: Icon(
                                Icons.favorite_border,
                                size: 30,
                                color: AppColors.orangeColor,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.orangeColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  context
                                          .read<ProductDetailsCubit>()
                                          .productDetails
                                          ?.category ??
                                      '',
                                  style: AppStyles.textStyle14.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context
                                    .read<ProductDetailsCubit>()
                                    .productDetails
                                    ?.title ??
                                '',
                            style: AppStyles.textStyle18.copyWith(
                              color: AppColors.darkGreenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.category,
                                height: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                context
                                        .read<ProductDetailsCubit>()
                                        .productDetails
                                        ?.category ??
                                    '',
                                style: AppStyles.textStyle14.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '${context.read<ProductDetailsCubit>().productDetails?.price ?? 0} EGP',
                        style: AppStyles.textStyle16.copyWith(
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context
                            .read<ProductDetailsCubit>()
                            .productDetails
                            ?.description ??
                        '',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle14,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            context
                                    .read<ProductDetailsCubit>()
                                    .productDetails
                                    ?.rating
                                    .toString() ??
                                '0',
                            textAlign: TextAlign.center,
                            style: AppStyles.textStyle16,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.orangeColor,
                            size: 25,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            context
                                    .read<ProductDetailsCubit>()
                                    .productDetails
                                    ?.stock
                                    .toString() ??
                                '0',
                            textAlign: TextAlign.center,
                            style: AppStyles.textStyle16,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.warehouse,
                            color: AppColors.orangeColor,
                            size: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
