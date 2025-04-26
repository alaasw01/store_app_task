import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app_task/utils/store_app.dart';
part '../../cubit/product_details_cubit.dart';
part '../../cubit/product_details_state.dart';
part 'widgets/product_images.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

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
        create: (context) => ProductDetailsCubit(),
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
                          itemCount: 3,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => ProductImages(
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
                              child: Image.asset(
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // You can add product title, description etc. here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Product Name',
                            style: AppStyles.textStyle20.copyWith(
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
                                'Product category',
                                style: AppStyles.textStyle14.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '500 EGP',
                        style: AppStyles.textStyle18.copyWith(
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Here is the product description. It looks amazing!',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle16,
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
