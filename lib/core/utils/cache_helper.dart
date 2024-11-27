import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // static Future<bool> setData<T>(
  //     {required String key, required T value}) async {
  //   switch (T) {
  //     case == String:
  //       return await _prefs.setString(key, value as String);
  //     case == bool:
  //       return await _prefs.setBool(key, value as bool);
  //     default:
  //       throw UnsupportedError('Unsupported type: ${T.toString()}');
  //   }
  // }

  static Future<bool> setData<T>(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await _prefs.setString(key, value);
    }
    return await _prefs.setBool(key, value);
  }
  // switch (T) {
  //   case == String:
  //     return await _prefs.setString(key, value as String);
  //   case == bool:
  //     return await _prefs.setBool(key, value as bool);
  //   default:
  //     throw UnsupportedError('Unsupported type: ${T.toString()}');
  // }
  //}
  // static bool? getBool({required String key}) {
  //   return _prefs.getBool(key);
  // }

  static dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }
}

// class SharedPrefHelper {
//   static SharedPreferences? _prefs;

//   // Initialize SharedPreferences
//   static Future<void> init() async {
//     _prefs ??= await SharedPreferences.getInstance();
//   }

//   // Save data with type safety and error handling
//   static Future<bool> saveData<T>({
//     required String key,
//     required T value,
//   }) async {
//     try {
//       if (_prefs == null) await init();
//       debugPrint("SharedPrefHelper: Saving $key with value: $value");
//       switch (T) {
//         case == String:
//           return await _prefs!.setString(key, value as String);
//         case == int:
//           return await _prefs!.setInt(key, value as int);
//         case == bool:
//           return await _prefs!.setBool(key, value as bool);
//         case == double:
//           return await _prefs!.setDouble(key, value as double);
//         case == List:
//           if (value is List<String>) {
//             return await _prefs!.setStringList(key, value);
//           }
//           throw UnsupportedError('Unsupported list type');
//         default:
//           throw UnsupportedError('Unsupported type: ${T.toString()}');
//       }
//     } catch (e) {
//       debugPrint("SharedPrefHelper Error: $e");
//       return false;
//     }
//   }

//   // Get data with type safety
//   static Object? getData<T>(String key) {
//     try {
//       final value = _prefs?.get(key);
//       if (value != null && value is T) {
//         return value;
//       }
//       return null;
//     } catch (e) {
//       debugPrint("SharedPrefHelper Error: $e");
//       return null;
//     }
//   }

//   // Remove data
//   static Future<bool> removeData(String key) async {
//     try {
//       return await _prefs?.remove(key) ?? false;
//     } catch (e) {
//       debugPrint("SharedPrefHelper Error: $e");
//       return false;
//     }
//   }

//   // Clear all data
//   static Future<bool> clearAll() async {
//     try {
//       return await _prefs?.clear() ?? false;
//     } catch (e) {
//       debugPrint("SharedPrefHelper Error: $e");
//       return false;
//     }
//   }
// }
