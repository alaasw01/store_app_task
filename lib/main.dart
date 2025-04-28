import 'package:flutter/material.dart';
import 'package:store_app_task/config/app_routes.dart';
import 'package:store_app_task/utils/cache_helper.dart';
import 'package:store_app_task/utils/injector.dart' as injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.setupServiceLocator();
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Store app task',
      theme: ThemeData(
        fontFamily: 'Fira Sans',
      ),
      routerConfig: router,
    );
  }
}
