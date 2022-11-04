import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/auth_screen.dart';
import 'package:product_catalog_app/feature/home/presentation/home_screen.dart';
import 'package:product_catalog_app/feature/home/presentation/provider/product_provider.dart';
import 'package:provider/provider.dart';

class AuthInit extends StatelessWidget {
  final token;
  const AuthInit({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    if (token != null) {
      print("auth");
      Provider.of<ProductProvider>(context, listen: false).getAllProduct();

      return const HomeScreen();
    } else {
      return const AuthScreen();
    }
  }
}
