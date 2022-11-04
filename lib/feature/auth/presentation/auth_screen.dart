import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/auth_type.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/toggle_buttons.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                ToggleButtonsGroup(),
                AuthTypeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
