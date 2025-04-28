import 'package:flutter/material.dart';

abstract class AppConstant {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String token = 'token';
  static const String email = 'email';
  static const String password = 'password';
}
