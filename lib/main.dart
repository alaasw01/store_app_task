import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_task/config/app_routes.dart';
import 'package:store_app_task/utils/cache_helper.dart';
import 'package:store_app_task/utils/injector.dart' as injector;
import 'package:store_app_task/utils/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.setupServiceLocator();
  await CacheHelper().init();
  final themeCubit = ThemeCubit();
  await themeCubit.initTheme();
  runApp(MyApp(themeCubit: themeCubit));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.themeCubit});
  final ThemeCubit themeCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Store app task',
            theme: state,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
