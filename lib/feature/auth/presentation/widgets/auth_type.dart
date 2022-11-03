import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/provider/auth_provider.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/login.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/register.dart';
import 'package:provider/provider.dart';

class AuthTypeWidget extends StatelessWidget {
  const AuthTypeWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      context.watch<AuthProvider>().toggleIndex == 0
          ? const Login()
          : const Register();
}
