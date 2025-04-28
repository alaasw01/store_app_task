import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app_task/utils/cache_helper.dart';
import 'package:store_app_task/utils/store_app.dart';

part '../../cubit/home_cubit.dart';
part '../../cubit/home_state.dart';
part 'widgets/custom_search_app_bar.dart';
part '../../../../shared_widgets/product_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
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
                (context, index) => ProductItem(
                  onDetailsTap: () => context.go(Routes.productDetails),
                  onFavoriteTap: () {},
                ),
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 180,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
