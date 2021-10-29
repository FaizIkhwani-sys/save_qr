import 'package:flutter/material.dart';

import 'package:masjid_pro/app/utils/styles/app_colors.dart';

class AppUploadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Muat naik certificate vaksin',
          style: TextStyle(
            color: AppColors.labelTextColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            TextButton.icon(
              icon: Icon(
                Icons.upload_rounded,
                color: AppColors.whiteColor,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.primaryColor,
                ),
              ),
              label: Text(
                'Upload',
                style: TextStyle(
                  color: AppColors.whiteColor,
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ],
    );
  }
}
