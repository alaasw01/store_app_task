import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app_task/contants/constants.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/features/home/data/repos/products_repo_impl.dart';
import 'package:store_app_task/features/home/domain/entities/products_entity.dart';
import 'package:store_app_task/features/home/domain/use_case/prodcuts_use_case.dart';
import 'package:store_app_task/shared_widgets/product_item.dart';
import 'package:store_app_task/utils/store_app.dart';
import 'package:store_app_task/utils/theme_cubit.dart';

part '../cubit/home_cubit.dart';
part '../cubit/home_state.dart';
part 'widgets/custom_search_app_bar.dart';
part 'widgets/price_range_filter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.orangeColor,
              ),
            );
          } else if (state is HomeFailed) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppStyles.textStyle16.copyWith(color: Colors.red),
              ),
            );
          } else if (state is HomeSuccess || state is HomeSearch) {
            return RefreshIndicator(
              onRefresh: context.read<HomeCubit>().getAllProducts,
              color: Colors.white,
              backgroundColor: AppColors.orangeColor,
              child: CustomScrollView(
                controller: context.read<HomeCubit>().scrollController,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(height: 40),
                        CustomSearchAppBar(
                          onFilterTap:
                              context.read<HomeCubit>().showPriceRangeSlider,
                        ),
                        if (context.read<HomeCubit>().isPriceRangeVisible ==
                            true) ...[
                          const SizedBox(height: 20),
                          const PriceRangeFilter(),
                        ],
                        const SizedBox(height: 15),
                        Text(
                          'Products',
                          style: AppStyles.textStyle18.copyWith(
                            color: AppColors.darkGreenColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ]),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ProductItem(
                            tag: context
                                .read<HomeCubit>()
                                .productsList[index]
                                .id,
                            onDetailsTap: () => context
                                .read<HomeCubit>()
                                .onDetailsTap(
                                  context.read<HomeCubit>().productsList[index],
                                ),
                            isFavorite: context
                                .read<HomeCubit>()
                                .productsList[index]
                                .isFavorite,
                            onFavoriteTap: () => context
                                .read<HomeCubit>()
                                .onFavoriteTap(
                                  context.read<HomeCubit>().productsList[index],
                                ),
                            product:
                                context.read<HomeCubit>().productsList[index],
                          );
                        },
                        childCount:
                            context.read<HomeCubit>().productsList.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 216,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.orangeColor,
            ));
          }
        },
      ),
    );
  }
}
