import 'package:flutter/material.dart';

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Ingrese un Email valido';
  else
    return null;
}

textfieldRadius(text) {
    return InputDecoration(
      contentPadding:
        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: text,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0)));
  }