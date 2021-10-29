import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:masjid_pro/app/utils/styles/app_colors.dart';

class AppSearchField extends StatelessWidget {
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final String hint;
  final TextInputType keyboardType;
  final Widget icon;
  final Widget prefixIcon;
  final Function onTap;
  final bool readOnly;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<String> validatorFunction;
  final ValueChanged<String> onSaveFunction;
  final ValueChanged<String> onChange;
  final FocusNode focusNode;
  final String errorText;
  final TextAlign textAlign;
  final bool obsecureText;
  final Color borderColor;
  final double borderWidth;
  final List<TextInputFormatter> inputFormatter;
  final bool enabled;
  final Function onTextFieldTap;
  final int maxLength;
  final TextStyle hintStyle;

  AppSearchField({
    this.textInputAction = TextInputAction.done,
    this.validatorFunction,
    this.onSaveFunction,
    this.onChange,
    this.focusNode,
    this.onSubmitted,
    this.controller,
    this.width = 300,
    this.margin = const EdgeInsets.symmetric(vertical: 4),
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.icon,
    this.onTap,
    this.readOnly = false,
    this.obsecureText,
    this.textAlign = TextAlign.center,
    this.prefixIcon,
    this.errorText,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.inputFormatter,
    this.enabled = true,
    this.onTextFieldTap,
    this.maxLength,
    this.hintStyle,
  });
  final BorderRadius borderRadius = BorderRadius.circular(50.0);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: this.focusNode,
      maxLength: this.maxLength,
      onTap: this.onTextFieldTap,
      enabled: this.enabled,
      controller: this.controller,
      onChanged: this.onChange,
      onSaved: this.onSaveFunction,
      onFieldSubmitted: this.onSubmitted,
      validator: this.validatorFunction,
      keyboardType: this.keyboardType,
      style: TextStyle(
        color: this.enabled ? AppColors.darkTextColor : AppColors.grayColor,
      ),
      decoration: InputDecoration(
        hintText: this.hint,
        fillColor: AppColors.whiteColor,
        filled: true,
        counterText: "",
        enabled: this.enabled,
        contentPadding: EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 10.0,
        ),
        hintStyle: this.hintStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.lightColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.lightColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.lightColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.dangerColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: AppColors.dangerColor,
            width: 1.2,
          ),
        ),
        suffixIcon: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
