import 'package:flutter/material.dart';
import 'package:store_app_task/config/app_routes.dart';

abstract class AppConstant {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? get ctx =>
      router.routerDelegate.navigatorKey.currentContext;
  static const String token = 'token';
  static const String email = 'email';
  static const String password = 'password';
  static const String favoritesBox = 'favoritesBox';
  static const String productsBox = 'productsBox';
}
