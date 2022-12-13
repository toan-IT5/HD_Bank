import 'package:hd_bank/Models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static void saveUser(User user) {
    SharedPref.save(SharedPrefPath.user, user.toJson());
  }

  static Future<User?> getUser() async {
    var result = await SharedPref.read(SharedPrefPath.user);
    if (result != null) {
      return User.fromJson(result);
    }
    return null;
  }

  static void saveKey(User user) {
    SharedPref.save(SharedPrefPath.key, user.toJson());
  }

  static Future<String> getKey() async {
    var result = await SharedPref.read(SharedPrefPath.key);
    if (result != null) {
      return result;
    }
    return "";
  }
}

class SharedPref {
  static save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case double:
        prefs.setDouble(key, value);
        break;
      case int:
        prefs.setInt(key, value);
        break;
      case bool:
        prefs.setBool(key, value);
        break;
      case List<String>:
        prefs.setStringList(key, value);
        break;
      default:
        prefs.setString(key, value);
    }
  }

  static Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

class SharedPrefPath {
  static const String key = "KEY";
  static const String user = "USER";
}
