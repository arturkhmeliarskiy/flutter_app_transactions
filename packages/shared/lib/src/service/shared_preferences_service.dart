import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late final SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();

    GetIt.I.registerSingleton(_prefs);
  }

  FutureOr<void> setString({
    required String key,
    required String value,
  }) async {
    await _prefs.setString(key, value);
  }

  Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    return _prefs.setBool(key, value);
  }

  bool? getBool({required String key}) {
    return _prefs.getBool(key);
  }

  String? getString({required String key}) {
    return _prefs.getString(key);
  }

  Future<bool> clear() {
    return _prefs.clear();
  }

  bool? containsKey({required String key}) {
    return _prefs.containsKey(key);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
