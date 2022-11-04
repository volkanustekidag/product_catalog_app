import 'dart:convert';
import 'dart:io';

import "package:http/http.dart" as http;
import 'package:product_catalog_app/feature/auth/data/dto/user_model.dart';

class UserServicesRemote {
  Future<dynamic> post(Map<String, dynamic> body, url) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          'Accept': 'application/json',
        },
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          final jsonBody = jsonDecode(response.body);
          return UserModel.fromJson(jsonBody).toEntity();
        default:
          throw response.body;
      }
    } catch (e) {
      return null;
    }
  }
}
