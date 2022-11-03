import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final String? label;
  const TextFieldForm({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
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
