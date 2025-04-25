import 'package:flutter/material.dart';
import 'package:store_app_task/config/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Store app task',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
      ),
      routerConfig: router,
    );
  }
}
