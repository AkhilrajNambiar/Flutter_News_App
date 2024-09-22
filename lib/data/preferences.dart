import 'package:hive_flutter/hive_flutter.dart';

class PreferenceManager {
  PreferenceManager({required Box<Object?> hiveBox}) {
    _hiveBox = hiveBox;
  }
  late final Box<Object?> _hiveBox;

  final _uid = 'uid';
  final _username = 'username';
  final _isDarkMode = 'isDarkMode';

  String getUid() => (_hiveBox.get(_uid) as String?) ?? '';

  Future<void> setUid(String uid) async {
    await _hiveBox.put(_uid, uid);
  }

  String getUsername() => (_hiveBox.get(_username) as String?) ?? '';

  Future<void> setUsername(String username) async {
    await _hiveBox.put(_username, username);
  }

  bool isDarkMode() => (_hiveBox.get(_isDarkMode) as bool?) ?? false;

  Future<void> setDarkMode(bool isDarkMode) async {
    await _hiveBox.put(_isDarkMode, isDarkMode);
  }

  Future<void> logout() async {
    await _hiveBox.clear();
  }
}
