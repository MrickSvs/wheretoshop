import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/shop.dart'; // Corrected the import path

class ShopProvider extends ChangeNotifier {
  List<Shop> _shops = [];

  List<Shop> get shops => _shops;

  Future<void> fetchShops() async {
    final response = await http.get(Uri.parse('http://localhost:3000/shops'));
    final List<dynamic> responseData = json.decode(response.body);
    _shops = responseData.map((data) => Shop.fromJson(data)).toList();
    notifyListeners();
  }
}
