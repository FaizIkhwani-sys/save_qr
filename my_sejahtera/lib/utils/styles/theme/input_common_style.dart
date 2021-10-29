import 'package:flutter/material.dart';

class InputCommonStyle {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "",
      String hintTextStr = "",
      IconData suffixIcon,
      Widget prefixIcon,
      String counterText,
      BuildContext context}) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      disabledBorder: Theme.of(context).inputDecorationTheme.disabledBorder,
      labelText: labelTextStr,
      hintText: hintTextStr,
      labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      hintStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      counterText: counterText,
      suffixIcon: suffixIcon != null
          ? Icon(suffixIcon, color: Theme.of(context).secondaryHeaderColor)
          : null,
    );
  }
}
