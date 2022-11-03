import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:product_catalog_app/feature/auth/presentation/utils/validations.dart';
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
        children: [
          TextFieldForm(
            label: "Name",
            validation: Validations().validationValue,
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
          ),
          TextFieldForm(
            label: "Password",
            validation: Validations().validationPassword,
          ),
          TextFieldForm(
            label: "Password",
            validation: Validations().validationPassword,
          )
        ],
      ),
    );
  }
}
