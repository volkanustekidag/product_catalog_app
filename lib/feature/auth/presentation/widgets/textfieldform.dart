import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final String? label;
  final validation;
  final inputFormatters;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  const TextFieldForm({
    Key? key,
    this.label,
    this.validation,
    this.textInputType,
    this.inputFormatters,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: textEditingController,
        validator: validation != null ? (value) => validation(value) : null,
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
    );
  }
}
