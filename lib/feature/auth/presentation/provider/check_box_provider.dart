import 'package:flutter/material.dart';

class CheckBoxProvider extends ChangeNotifier {
  bool rememberMe = false;

  rememberMeBox() {
    rememberMe = !rememberMe;
    notifyListeners();
  }
}
