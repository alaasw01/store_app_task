import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:store_app_task/config/app_routes.dart';
import 'package:store_app_task/contants/constants.dart';
import 'package:store_app_task/features/home/data/data_source/local_products_data_source.dart';
import 'package:store_app_task/features/home/data/data_source/remote_prodcuts_data_source.dart';
import 'package:store_app_task/features/home/data/repos/products_repo_impl.dart';
import 'package:store_app_task/features/home/domain/entities/products_entity.dart';
import 'package:store_app_task/features/home/domain/use_case/prodcuts_use_case.dart';
import 'package:store_app_task/features/home/presentation/view/home_view.dart';
import 'package:store_app_task/utils/cache_helper.dart';
import 'package:store_app_task/utils/injector.dart' as injector;
import 'package:store_app_task/utils/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.setupServiceLocator();
  await CacheHelper().init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductEntityAdapter());
  await Hive.openBox<ProductEntity>(AppConstant.favoritesBox);
  final themeCubit = ThemeCubit();
  await themeCubit.initTheme();
  runApp(MyApp(themeCubit: themeCubit));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.themeCubit});
  final ThemeCubit themeCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: themeCubit),
        BlocProvider(
          create: (_) =>  HomeCubit(
        productsRepoImpl: ProductsRepoImpl(
          ProductsRemoteDataSourceImpl(),
          ProductsLocalDataSourceImpl(),
        ),
        prodcutsUseCase: ProdcutsUseCase(ProductsRepoImpl(
          ProductsRemoteDataSourceImpl(),
          ProductsLocalDataSourceImpl(),
        )),
      )..initCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Store app task',
            theme: theme,
            routerConfig: router,
          );
        },
      ),
    );
  }
}

