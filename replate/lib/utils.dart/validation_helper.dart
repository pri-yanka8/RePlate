import 'package:flutter/material.dart';

class ValidationHelper {
  static String? validatePhone(String phone) {
    phone = phone.trim();
    if (phone.isEmpty) {
      return "Phone number is required.";
    } else if (phone.length != 10) {
      return "Phone number must be exactly 10 digits.";
    }
    return null; // No error
  }

  static String? validateUsername(String username) {
    username = username.trim();
    if (username.isEmpty) {
      return "Username is required.";
    } else if (username.length < 6) {
      return "Username must be at least 6 characters.";
    }
    return null;
  }

  static String? validatePassword(String password) {
    password = password.trim();
    if (password.isEmpty) {
      return "Password is required.";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters.";
    }
    return null;
  }
}
