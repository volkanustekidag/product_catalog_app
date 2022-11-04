import 'dart:convert';
import 'dart:io';

import "package:http/http.dart" as http;
import 'package:product_catalog_app/core/data/dto/all_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductServices {
  Future<dynamic> get(url) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'access-token': token!,
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
}
