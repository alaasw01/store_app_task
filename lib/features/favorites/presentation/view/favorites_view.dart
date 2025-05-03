import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app_task/shared_widgets/product_item.dart';
import 'package:store_app_task/utils/store_app.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            'Favorites',
            style: AppStyles.textStyle18,
          ),
          leading: GestureDetector(
            onTap: () {
              context.go(Routes.home);
              context.read<HomeCubit>().checkFavoriteItem();
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: context.read<HomeCubit>().favoritesList.isNotEmpty
                  ? GridView.builder(
                      itemCount: context.read<HomeCubit>().favoritesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 216,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) => ProductItem(
                        isFavorite: true,
                        tag: context
                            .read<HomeCubit>()
                            .favoritesList[index]
                            .productId,
                        product: context.read<HomeCubit>().favoritesList[index],
                        onDetailsTap: () => context.go(
                            '${Routes.productDetails}/${context.read<HomeCubit>().favoritesList[index].productId}'),
                        onFavoriteTap: () {
                          context.read<HomeCubit>().removeFromFavorites(
                              context.read<HomeCubit>().favoritesList[index]);
                        },
                      ),
                    )
                  : Center(
                      child: Text('No Favorites Yet',
                          style: AppStyles.textStyle25.copyWith(
                            color: AppColors.orangeColor,
                          )),
                    ),
            );
          },
        ));
  }
}
