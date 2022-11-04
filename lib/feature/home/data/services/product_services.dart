import 'dart:convert';
import 'dart:io';

import "package:http/http.dart" as http;
import 'package:product_catalog_app/feature/home/data/dto/all_product_model.dart';
import 'package:product_catalog_app/feature/home/data/dto/favorite_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductServices {
  Future<dynamic> get(url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'access-token': await getToken(),
        },
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          final jsonBody = jsonDecode(response.body);
          return AllProductModel.fromJson(jsonBody).toEntity();
        default:
          throw response.body;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token!;
  }

  Future<dynamic> post(Map<String, dynamic> body, url) async {
    final response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        'Accept': 'application/json',
        'access-token': await getToken(),
      },
    );
    print(response.body);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        return FavoriteModel.fromJson(jsonBody);
      default:
        throw response.body;
    }
  }
}
