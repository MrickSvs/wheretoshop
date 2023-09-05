import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/shop.dart';

class ShopProvider with ChangeNotifier {
  List<Shop> _shops = [];
  List<Shop> _filteredShops = [];

  List<Shop> get shops {
    return [..._filteredShops.isEmpty ? _shops : _filteredShops];
  }

  Future<void> fetchShops() async {
    const url = 'https://wheretoshop.onrender.com/shops';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _shops = data.map<Shop>((item) => Shop.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw const HttpException('Failed to load shops');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      rethrow;
    }
  }

  Future<void> filterShopsByStyle(String style) async {
    if (style == 'all') {
      _filteredShops = [];
    } else {
      ShopStyle styleEnum = ShopStyle.values
          .firstWhere((e) => e.toString().split('.').last == style);
      _filteredShops =
          _shops.where((shop) => shop.style.contains(styleEnum)).toList();
    }
    notifyListeners();
  }

  void resetFilter() {
    _filteredShops = [];
    notifyListeners();
  }
}
