import 'package:flutter/material.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import 'package:masjid_pro/app/utils/styles/app_colors.dart';
import 'package:masjid_pro/app/utils/app_size.dart';

class AppDateTimeField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<DateTime> validatorFunction;
  final String errorText;
  final ValueChanged<DateTime> onChange;
  final bool isApplication;

  AppDateTimeField({
    this.label,
    this.controller,
    this.validatorFunction,
    this.errorText,
    this.onChange,
    this.isApplication = false,
  });

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.label ?? '',
          style: TextStyle(
            color: AppColors.labelTextColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: AppSize.spaceX8,
        ),
        Container(
          child: DateTimeField(
            controller: this.controller,
            onChanged: this.onChange,
            format: format,
            validator: this.validatorFunction,
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
              errorText: this.errorText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightColor,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.dangerColor,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.dangerColor,
                  width: 1.2,
                ),
              ),
            ),
            onShowPicker: (context, currentValue) async {
              return showDatePicker(
                context: context,
                initialDate: currentValue ?? DateTime.now(),
                firstDate: isApplication ? DateTime(1900) : DateTime.now(),
                lastDate: isApplication ? DateTime.now() : DateTime(2100),
              );
            },
          ),
        ),
      ],
    );
  }
}
