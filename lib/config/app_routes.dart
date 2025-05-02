import 'package:flutter/material.dart';
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
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 1000),
            child: const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.linear).animate(animation),
                child: child,
              );
            },
          );
        }),
    GoRoute(
      path: '${Routes.productDetails}/:id',
      pageBuilder: (context, state) {
        final id = num.tryParse(state.pathParameters['id']!);
        return MaterialPage(
            key: state.pageKey, child: ProductDetailsView(productId: id ?? 0));
      },
    ),
    GoRoute(
      path: Routes.favorites,
      builder: (context, state) => const FavoritesView(),
    ),
  ],
);
