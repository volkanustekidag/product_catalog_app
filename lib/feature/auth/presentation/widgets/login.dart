import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/utils/validations.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/textfieldform.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFieldForm(
            label: "E-mail",
            validation: Validations().validationEmail,
          ),
          TextFieldForm(
            label: "Password",
            validation: Validations().validationPassword,
          ),
        ],
      ),
    );
  }
}
