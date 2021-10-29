import 'package:flutter/material.dart';

import 'package:masjid_pro/app/utils/styles/app_colors.dart';
import 'package:masjid_pro/app/utils/app_route.dart';

class AppSecondaryBar extends StatelessWidget {
  final Widget body;
  final String title;
  final bool centerTitle;
  final double elevation;
  final Color backgroundColor;
  final Function onPressed;
  final Widget bottomNavigationBar;
  final bool hasBackButton;
  final List<Widget> actions;

  AppSecondaryBar({
    this.body,
    this.title,
    this.centerTitle = false,
    this.elevation = 4.0,
    this.backgroundColor = AppColors.backgroundColor,
    this.onPressed,
    this.bottomNavigationBar,
    this.hasBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          this.title,
          style: TextStyle(color: Colors.white),
        ),
        elevation: this.elevation,
        centerTitle: centerTitle,
        backgroundColor: AppColors.primaryColor,
        leading: hasBackButton
            ? BackButton(
                onPressed: onPressed ?? () => AppRoute.pop(context),
                color: Colors.white,
              )
            : Container(),
        actions: actions,
      ),
      body: this.body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
