import 'package:flutter/material.dart';

import 'package:masjid_pro/app/utils/app_size.dart';
import 'package:masjid_pro/app/utils/styles/app_colors.dart';
import '../../../app/utils/extensions/string_extensions.dart';

class AppUploadField extends StatelessWidget {
  final String label;
  final Function onTap;
  final String errorText;

  AppUploadField({
    this.label,
    this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyle(
            color: AppColors.labelTextColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.0),
        GestureDetector(
          onTap: this.onTap,
          child: Container(
            width: AppSize.widthScreen(context),
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: AppColors.lightColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload,
                  color: AppColors.labelTextColor,
                ),
                Text(
                  'Muat naik disini',
                  style: TextStyle(
                    color: AppColors.labelTextColor,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 6.0),
        if (!errorText.isNullOrWhiteSpace)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              errorText,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.0,
              ),
            ),
          ),
      ],
    );
  }
}
