import 'package:flutter/material.dart';

extension contextEx on BuildContext {
  ShowSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
