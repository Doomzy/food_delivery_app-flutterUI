import 'package:shared_preferences/shared_preferences.dart';

class CacheHandler {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<dynamic> savePref({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else {
      return await sharedPreferences!.setDouble(key, value);
    }
  }

  static dynamic getPref({required String key}) {
    return sharedPreferences!.get(key);
  }

  static dynamic deletePref({required String key}) {
    return sharedPreferences!.remove(key);
  }
}
