import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SearchProvider with ChangeNotifier {
  final Dio _dio = Dio();
  List<dynamic> _items = [];
  List<dynamic> _filteredItems = [];

  List<dynamic> get items => _filteredItems;

  Future<void> fetchItems() async {
    try {
      // Replace this URL with your actual API endpoint
      final response = await _dio.get('https://gofit-7036c-default-rtdb.firebaseio.com/all_exercise.json');
      _items = response.data; // Assume response data is already a list
      _filteredItems = _items;
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching items: $e");
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      _filteredItems = _items;
    } else {
      _filteredItems = _items
          .where((item) =>
              item['name'].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
