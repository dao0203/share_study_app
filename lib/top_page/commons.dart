import 'package:flutter/material.dart';

TextField inputField(String label, bool obscure) {
    return TextField(
      enabled: true,
      maxLines: 1,
      obscureText: obscure,
      decoration: InputDecoration(hintText: '', labelText: label),
    );
  }