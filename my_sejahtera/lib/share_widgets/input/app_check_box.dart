import 'package:flutter/material.dart';

import 'package:masjid_pro/app/utils/styles/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChange;
  final String title;

  AppCheckBox({
    this.value,
    this.onChange,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      activeColor: AppColors.primaryColor,
      checkColor: AppColors.whiteColor,
      contentPadding: EdgeInsets.all(0),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      onChanged: onChange,
      title: Text(
        title ?? '',
      ),
    );
  }
}
