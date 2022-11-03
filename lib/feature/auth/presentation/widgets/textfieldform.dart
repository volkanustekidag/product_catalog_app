import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final String? label;
  final validation;
  final inputFormatters;
  final TextInputType? textInputType;
  const TextFieldForm(
      {Key? key,
      this.label,
      this.validation,
      this.textInputType,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          validator: validation != null ? (value) => validation(value) : null,
          keyboardType: textInputType,
          inputFormatters: inputFormatters ?? [],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            label: Text(
              label!,
            ),
          ),
        ),
      ),
    );
  }
}
