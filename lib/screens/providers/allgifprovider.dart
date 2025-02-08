import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AllProvider with ChangeNotifier {
  final Dio dio = Dio();
  List<dynamic> items = [];
  Future<void> fetchItems() async {
    try {
      // Replace this URL with your actual API endpoint
      final response = await dio.get('https://gofit-7036c-default-rtdb.firebaseio.com/gofit.json');
      items = response.data; // Assume response data is already a list
      
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching items: $e");
    }
  }
}
