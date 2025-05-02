import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app_task/utils/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightTheme);
  bool isLightTheme = true;

  static final ThemeData lightTheme = ThemeData(brightness: Brightness.light);
  static final ThemeData darkTheme = ThemeData(brightness: Brightness.dark);

  void toggleTheme() {
    isLightTheme = !isLightTheme;
    emit(isLightTheme ? lightTheme : darkTheme);
    CacheHelper.saveSharedData(key: 'theme', value: isLightTheme);
    debugPrint('Theme changed to $isLightTheme');
  }

  Future<void> initTheme() async {
    isLightTheme = CacheHelper.getSharedData(key: 'theme') ?? true;
    emit(isLightTheme ? lightTheme : darkTheme);
    debugPrint('Loaded theme: $isLightTheme');
  }
}
