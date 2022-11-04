import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/provider/new_provider.dart';
import 'package:provider/provider.dart';

class RememberMeCheckBox extends StatelessWidget {
  const RememberMeCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(context.widget.toString());

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text("Remember me "),
        Checkbox(
            value: Provider.of<CheckBoxProvider>(context).rememberMe,
            onChanged: (value) {
              Provider.of<CheckBoxProvider>(context, listen: false)
                  .rememberMeBox();
            })
      ],
    );
  }
}
