import 'package:flutter/material.dart';
import 'package:secret_box/datasource/hive_datasource.dart';

class MainProvider extends ChangeNotifier {
  HiveDataSource hiveDS = HiveDataSource();
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  Future<bool> openBox(String boxName, String password) async {
    _isLogin = await hiveDS.openBox(boxName, password);
    return _isLogin;
  }
}
