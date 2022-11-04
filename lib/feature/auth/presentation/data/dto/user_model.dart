import 'package:product_catalog_app/feature/auth/presentation/domain/entity/user.dart';

class UserModel {
  String? token;
  String? message;

  UserModel({this.token, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['message'] = message;
    return data;
  }

  User toEntity() => User(token: token);
}
