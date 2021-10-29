import 'package:flutter/material.dart';
import 'package:masjid_pro/app/utils/app_size.dart';
import 'package:masjid_pro/app/utils/styles/app_colors.dart';

import '../../utils/extensions/string_extensions.dart';

class AppAduanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String secondarySubtitle;
  final Function onTap;

  AppAduanCard({
    this.title,
    this.subtitle,
    this.secondarySubtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.spaceX16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toLowerCase().capitalizeFirstofEach ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: AppSize.spaceX8),
                Row(
                  children: [
                    Icon(Icons.home_work),
                    SizedBox(width: AppSize.spaceX8),
                    Text(
                      subtitle ?? '',
                      style: TextStyle(
                        color: AppColors.labelTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.spaceX6),
                Row(
                  children: [
                    Icon(Icons.more_horiz),
                    SizedBox(width: AppSize.spaceX8),
                    Text(
                      secondarySubtitle ?? '',
                      style: TextStyle(
                        color: AppColors.labelTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18.0,
              color: AppColors.grayColor,
            )
          ],
        ),
      ),
    );
  }
}
