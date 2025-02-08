import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavoriteProvider extends ChangeNotifier {
  List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void toggleFavorite(
      String name, String gif, String sets, String reps, String rest) async {
    final isExist = _favorites.any((fav) => fav['name'] == name);
    if (isExist) {
      _favorites.removeWhere((fav) => fav['name'] == name);
    } else {
      _favorites.add(
          {'name': name, 'gif': gif, 'sets': sets, 'reps': reps, 'rest': rest});
    }
    notifyListeners(); //it is like a setState in GlobalVariable
    await saveFavorites();
  }

  bool isExist(String name) {
    return _favorites.any((fav) => fav['name'] == name);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favorites', json.encode(_favorites));
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesString = prefs.getString('favorites');
    if (favoritesString != null) {
      List<dynamic> favoriteList = json.decode(favoritesString);
      _favorites = favoriteList.map((fav) => Map<String, String>.from(fav)).toList();
      notifyListeners();
    }
  }
}
