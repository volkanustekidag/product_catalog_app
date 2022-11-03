import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/textfieldform.dart';

class Register extends StatelessWidget {
  const Register({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          TextFieldForm(
            label: "Name",
          ),
          TextFieldForm(
            label: "Surname",
          ),
          TextFieldForm(
            label: "Phone Number",
          ),
          TextFieldForm(
            label: "E-mail",
          ),
          TextFieldForm(
            label: "Password",
          ),
          TextFieldForm(
            label: "Password",
          )
        ],
      ),
    );
  }
}
