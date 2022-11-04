import 'dart:async';

import 'package:flutter/material.dart';
import 'package:product_catalog_app/core/const/urls.dart';
import 'package:product_catalog_app/feature/auth/data/services/local/user_service_local.dart';
import 'package:product_catalog_app/feature/auth/data/services/remote/user_services_remote.dart';
import 'package:product_catalog_app/feature/auth/domain/entity/user.dart';
import 'package:product_catalog_app/feature/home/presentation/home_screen.dart';

class UserRepository {
  final UserServicesRemote _userServicesRemote = UserServicesRemote();
  final UserServiceLocal _userServiceLocal = UserServiceLocal();
  final BuildContext? context;

  UserRepository({this.context});

  FutureOr<User?> userRegister(name, email, password) async {
    Map<String, dynamic> register = {
      "name": name,
      "password": password,
      "email": email,
    };

    User user = await _userServicesRemote.post(register, Urls.REGISTER_URL);

    if (user.token!.isEmpty) {
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
        content: Text("ERROR!"),
      ));
    } else {
      Navigator.pushReplacement(
        context!,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
    return null;
  }

  FutureOr<User?> userLogin(email, password, bool) async {
    Map<String, dynamic> login = {
      "password": password,
      "email": email,
    };

    User user = await _userServicesRemote.post(login, Urls.LOGIN_URL);

    if (user.token!.isEmpty) {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1),
          content: Text("ERROR!"),
        ),
      );
    } else {
      if (bool == true) {
        await saveToken(user.token);
      }

      Navigator.pushReplacement(
        context!,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
    return null;
  }

  FutureOr saveToken(token) async {
    _userServiceLocal.saveToken(token);
  }
}
