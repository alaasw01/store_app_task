import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static late FlutterSecureStorage secureStorage;

//! Here The Initialize of cache .
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    secureStorage = const FlutterSecureStorage();
  }

//! this method to put data in local database using key

  static String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

//! this method to put data in local database using key

  static Future<bool> saveSharedData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

//! this method to get data already saved in local database

  static dynamic getSharedData({required String key}) {
    return sharedPreferences.get(key);
  }

//! remove data using specific key

  static Future<bool> removeSharedData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

//! this method to check if local database contains {key}
  static Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

//! clear all data in the local database
  static Future<bool> clearSharedData() async {
    return await sharedPreferences.clear();
  }

//! this method to put data in local database using key
  static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  /////////////////// Secure Storage /////////////////////
  static Future<void> saveSecuredData(
      {required String key, required dynamic value}) async {
    return await secureStorage.write(key: key, value: value);
  }

  static Future<String?> readSecuredData({required String key}) async {
    return await secureStorage.read(key: key);
  }

  static Future<void> deleteSecuredData({required String key}) async {
    return await secureStorage.delete(key: key);
  }

  static Future<void> clearSecuredData() async {
    return await secureStorage.deleteAll();
  }
}
