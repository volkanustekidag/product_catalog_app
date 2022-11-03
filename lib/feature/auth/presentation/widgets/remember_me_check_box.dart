import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class RememberMeCheckBox extends StatelessWidget {
  const RememberMeCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text("Remember me "),
        Checkbox(
          value: context.watch<AuthProvider>().rememberMe,
          onChanged: (value) {
            context.read<AuthProvider>().rememberMeBox();
          },
        ),
      ],
    );
  }
}
