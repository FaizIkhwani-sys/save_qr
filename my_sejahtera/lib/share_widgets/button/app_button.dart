import 'package:flutter/material.dart';

import 'package:masjid_pro/app/utils/styles/app_colors.dart';
import 'package:masjid_pro/app/utils/app_size.dart';

class AppButton extends StatelessWidget {
  final String btnTitle;
  final Function onTap;
  final Color backgroundColor;

  AppButton({
    this.btnTitle,
    this.onTap,
    this.backgroundColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap ?? null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: this.backgroundColor,
        ),
        child: Center(
          child: Text(
            this.btnTitle ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryColor,
              fontSize: AppSize.fontLargeX2,
            ),
          ),
        ),
      ),
    );
  }
}
