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
    const url = 'http://localhost:3000/shops';
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
}

class HttpException {
  HttpException(String s);
}
