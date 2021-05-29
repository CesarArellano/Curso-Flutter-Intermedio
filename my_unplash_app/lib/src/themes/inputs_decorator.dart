import 'package:flutter/material.dart';

InputDecoration decorationInput(IconData icon, String text) {
  return InputDecoration(
    icon: Icon( icon ),
    hintText: text,
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.circular(8.0)
    )
  );
}