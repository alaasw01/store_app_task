import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app_task/utils/store_app.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.home,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
      ],
    ),
  ],
);
