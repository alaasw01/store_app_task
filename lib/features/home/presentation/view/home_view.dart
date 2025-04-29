import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app_task/features/home/data/data_source/remote_prodcuts_data_source.dart';
import 'package:store_app_task/features/home/data/model/products.dart';
import 'package:store_app_task/features/home/data/repos/products_repo_impl.dart';
import 'package:store_app_task/features/home/domain/use_case/prodcuts_use_case.dart';
import 'package:store_app_task/shared_widgets/product_item.dart';
import 'package:store_app_task/utils/store_app.dart';

part '../cubit/home_cubit.dart';
part '../cubit/home_state.dart';
part 'widgets/custom_search_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
          ProdcutsUseCase(ProductsRepoImpl(ProductsRemoteDataSourceImpl()))),
      child: Scaffold(
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
            } else if (state is HomeSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(height: 30),
                        const CustomSearchAppBar(),
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
                          final product =
                              context.read<HomeCubit>().productsList![index];
                          return ProductItem(
                            onDetailsTap: () => context
                                .go('${Routes.productDetails}/${product.id}'),
                            onFavoriteTap: () {},
                            product: product,
                          );
                        },
                        childCount:
                            context.read<HomeCubit>().productsList?.length ?? 0,
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
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
