import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/data/repositories/user_repositories.dart';
import 'package:product_catalog_app/feature/auth/presentation/provider/check_box_provider.dart';
import 'package:product_catalog_app/feature/auth/presentation/utils/validations.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/auth_button.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/remember_me_check_box.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/textfieldform.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(context.widget.toString());

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldForm(
              label: "E-mail",
              validation: Validations().validationEmail,
              textEditingController: textEditingControllerEmail,
            ),
            TextFieldForm(
              label: "Password",
              validation: Validations().validationPassword,
              textEditingController: textEditingControllerPassword,
            ),
            const RememberMeCheckBox(),
            AuthButton(
              title: "Login",
              onPressed: () => _formKey.currentState!.validate()
                  ? UserRepository(context: context).userLogin(
                      textEditingControllerEmail.value.text,
                      textEditingControllerPassword.value.text,
                      Provider.of<CheckBoxProvider>(context, listen: false)
                          .rememberMe,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
