import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/shop.dart';

class ShopProvider extends ChangeNotifier {
  List<Shop> _shops = [];

  List<Shop> get shops => _shops;

  Future<void> fetchShops() async {
    final response = await http.get(Uri.parse('https://your-api-url.com/shops'));
    final List<dynamic> responseData = json.decode(response.body);
    _shops = responseData.map((data) => Shop.fromJson(data)).toList();
    notifyListeners();
  }
}
