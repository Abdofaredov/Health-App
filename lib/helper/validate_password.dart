import 'package:flutter/material.dart';

// ignore: no_leading_underscores_for_local_identifiers
validatePassword(String? value, TextEditingController _passcontroller) {
  if (value!.isEmpty) {
    return 'Enter password';
  }
  if (_passcontroller.text.length < 6) {
    return 'too weak';
  }
  bool validateEmail = RegExp(r'^[a-zA-Z0-9._%+-]+[a-zA]').hasMatch(value);
  if (!validateEmail) {
    return 'Un healthy password , You Should \n be Write Some Latters capital And Small ';
  } else {
    return null;
  }
}
