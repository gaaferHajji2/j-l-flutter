import 'package:flutter/widgets.dart';

class Validate {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter email';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return 'Enter email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter password';
    }
    if (value.length < 6) {
      return 'Password too short';
    }
    return null;
  }

  static String? validateConfirm(
    String? value,
    TextEditingController passCtrl,
  ) {
    if (value != passCtrl.text) return 'Passwords do not match';
    return null;
  }
}
