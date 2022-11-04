import 'package:flutter/material.dart';

class ProductDetailRow extends StatelessWidget {
  const ProductDetailRow({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  final value;
  final title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          value.toString(),
        ),
        const Divider()
      ],
    );
  }
}
