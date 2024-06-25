import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> save(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }

  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(key) != null) {
      return prefs.getString(key);
    }

    return null;
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.remove(key);
  }

  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(key);
  }
}
