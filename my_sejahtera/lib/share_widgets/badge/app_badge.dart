import 'package:flutter/material.dart';

import 'package:masjid_pro/app/utils/app_size.dart';
import 'package:masjid_pro/app/utils/styles/app_colors.dart';

class AppBadge extends StatelessWidget {
  final String title;
  final bool isSuccess;
  final Function onTap;
  final Color color;
  final double width;

  AppBadge({
    this.title,
    this.isSuccess = true,
    this.onTap,
    this.color = AppColors.primaryColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.spaceX16,
          vertical: AppSize.spaceX6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Text(
          title ?? '',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 8.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
