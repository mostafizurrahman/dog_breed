import 'package:flutter/material.dart';

class ThemeProvider {
  static BoxDecoration get shadow => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 2,
          ),
        ],
      );

  static BoxDecoration get circle => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(1000),
    ),
    border: Border.all(color: Colors.black54, width: 1),
  );
}
