import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/models/shop.dart';

class ShopProvider with ChangeNotifier {
  List<Shop> _shops = [];

  List<Shop> get shops {
    return [..._shops];
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
        throw HttpException('Failed to load shops');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      rethrow;
    }
  }

  Future<void> filterShopsByStyle(String style) async {
    final url = 'https://wheretoshop.onrender.com/shops?style=$style';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _shops = data.map<Shop>((item) => Shop.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw HttpException('Failed to load filtered shops');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      rethrow;
    }
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}
