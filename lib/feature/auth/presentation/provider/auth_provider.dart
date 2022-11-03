import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  int toggleIndex = 0;
  bool rememberMe = false;

  changeToggleValue() {
    toggleIndex = toggleIndex == 0 ? 1 : 0;
    notifyListeners();
  }

  rememberMeBox() {
    rememberMe = !rememberMe;
    notifyListeners();
  }
}
