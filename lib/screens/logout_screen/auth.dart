import 'package:flutter/material.dart';
import '../login_screen/login_screen.dart';

class Auth {
  static void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
      (Route<dynamic> route) => false,
    );
  }
}
