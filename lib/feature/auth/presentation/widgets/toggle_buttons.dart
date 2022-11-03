import 'package:flutter/material.dart';
import 'package:product_catalog_app/feature/auth/presentation/widgets/toggle_button.dart';

class ToggleButtonsGroup extends StatelessWidget {
  const ToggleButtonsGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ToggleButton(
            title: "LOGİN",
            index: 0,
          ),
          ToggleButton(
            title: "REGİSTER",
            index: 1,
          ),
        ],
      ),
    );
  }
}
