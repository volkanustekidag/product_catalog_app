import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({Key? key, @required this.title, @required this.index})
      : super(key: key);
  final String? title;
  final int? index;

  @override
  Widget build(BuildContext context) {
    var toggleIndex = context.watch<AuthProvider>().toggleIndex;
    return InkWell(
      onTap: () {
        context.read<AuthProvider>().changeToggleValue();
      },
      child: Container(
        color: index == toggleIndex ? Colors.blue : Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title!,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
