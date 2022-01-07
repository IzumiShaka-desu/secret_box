import 'package:flutter/material.dart';
import 'package:secret_box/datasource/hive_datasource.dart';
import 'package:secret_box/model/note.dart';

class MainProvider extends ChangeNotifier {
  HiveDataSource hiveDS = HiveDataSource();
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  List<Note> _notes = [];
  List<Note> get notes => _notes;
  Future<bool> openBox(String boxName, String password) async {
    _isLogin = await hiveDS.openBox(boxName, password);
    notifyListeners();
    return _isLogin;
  }

  void closeBox() async {
    _isLogin = false;
    await hiveDS.closeBox();
    _notes = [];

    notifyListeners();
  }

  void addNotes(Note newNote) async {
    final isSuccess = await hiveDS.addNote(newNote);
    if (isSuccess) {
      loadNotes();
    }
  }

  void loadNotes() async {
    _notes = await hiveDS.getNotes();
    notifyListeners();
  }
}
