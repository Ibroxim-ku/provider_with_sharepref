import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_with_sharepreferance/pages/models/notes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteController with ChangeNotifier {
  List<Note> _items = [];

  NoteController() {
    initialState();
  }

  UnmodifiableListView<Note> get allItems => UnmodifiableListView(_items);

  void initialState() {
    syncDataWithProvider();
  }

  void addItem(Note note) {
    _items.add(note);

    updateSharedPrefrences();

    notifyListeners();
  }

  void removeItem() {
    _items.removeWhere((element) => element.isSelected);
    updateSharedPrefrences();

    notifyListeners();
  }

  int getItemsLenght() {
    return _items.length;
  }

  Future updateSharedPrefrences() async {
    List<String> myItems = _items.map((e) => json.encode(e.toJson())).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("notes", myItems);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList("notes");
    if (result != null) {
      _items = result.map((e) => Note.fromJson(json.decode(e))).toList();
    }
    notifyListeners();
  }

  void changeValue(Note note) {
    note.isSelected = !note.isSelected;
    notifyListeners();
  }

  //update

  void updateItemValue(Note note, String newTitle, String newDescription) {
    note.title = newTitle;
    note.description = newDescription;
    updateSharedPrefrences();
    notifyListeners();
  }
}
