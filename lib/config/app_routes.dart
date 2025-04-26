import 'package:go_router/go_router.dart';
import 'package:store_app_task/features/favorites/presentation/view/favorites_view.dart';
import 'package:store_app_task/features/product_details/presentation/view/product_details.dart';
import 'package:store_app_task/utils/store_app.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.initial,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: Routes.productDetails,
      builder: (context, state) => const ProductDetailsView(),
    ),
    GoRoute(
      path: Routes.favorites,
      builder: (context, state) => const FavoritesView(),
    ),
  ],
);
