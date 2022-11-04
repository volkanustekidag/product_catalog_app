import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:product_catalog_app/feature/auth/presentation/data/repositories/user_repositories.dart';
import 'package:product_catalog_app/feature/auth/presentation/utils/validations.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/auth_button.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/textfieldform.dart';

class Register extends StatelessWidget {
  Register({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerPassword =
      TextEditingController();
  final TextEditingController textEditingControllerName =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldForm(
              label: "Name",
              validation: Validations().validationValue,
              textEditingController: textEditingControllerName,
            ),
            TextFieldForm(
              label: "Surname",
              validation: Validations().validationValue,
            ),
            TextFieldForm(
              label: "Phone Number",
              textInputType: TextInputType.number,
              inputFormatters: [
                MaskTextInputFormatter(
                    mask: '+9# (###) ###-##-##',
                    filter: {"#": RegExp(r'[0-9]')},
                    type: MaskAutoCompletionType.lazy)
              ],
            ),
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
            TextFieldForm(
              label: "Password",
              validation: Validations().validationPassword,
            ),
            AuthButton(
              title: "Register",
              onPressed: () => _formKey.currentState!.validate()
                  ? UserRepository(context: context).userRegister(
                      textEditingControllerName.value.text,
                      textEditingControllerEmail.value.text,
                      textEditingControllerPassword.value.text)
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
