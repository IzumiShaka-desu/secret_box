import 'package:encrypt/encrypt.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:secret_box/model/note.dart';
import 'package:secret_box/utils.dart';

class HiveDataSource {
  HiveDataSource._internal();
  static final _singleton = HiveDataSource._internal();
  factory HiveDataSource() => _singleton;
  Box? _box;
  Box? get box => _box;
  void openBox(String boxName, String password) async {
    String keyString = generateKey(password);
    String encryptedName = generateEncyptedName(boxName, password);
    _box = await Hive.openBox(
      encryptedName,
      encryptionCipher: HiveAesCipher(Key.fromUtf8(keyString).bytes),
    );
  }
}
