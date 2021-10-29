import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:masjid_pro/app/data/models/account/user_model.dart';
import 'package:masjid_pro/app/data/services/auth_service.dart';
import 'package:masjid_pro/app/data/services/user_service.dart';
import 'package:masjid_pro/app/utils/styles/app_colors.dart';

class AppMainBar extends StatelessWidget {
  final Widget child;
  final bool hasAppBar;
  final Color backgroundColor;
  final Color appBarColor;
  final String title;
  final bool centerTitle;
  final bool showLoading;
  final double elevation;
  final Color colorLoading;
  final List<Widget> action;
  final bool hasBottomNavigation;
  final Widget bottomNavigationBar;
  final bool hasDrawer;
  final Function onBackFunction;
  final bool leading;

  AppMainBar({
    this.child,
    this.hasAppBar = true,
    this.backgroundColor = AppColors.whiteColor,
    this.appBarColor = AppColors.primaryColor,
    this.title,
    this.showLoading = false,
    this.centerTitle = false,
    this.elevation,
    this.colorLoading,
    this.action,
    this.hasBottomNavigation = false,
    this.bottomNavigationBar,
    this.hasDrawer = false,
    this.onBackFunction,
    this.leading = false,
  });

  final User _user = UserService.to.user.value;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: this.backgroundColor,
          drawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    '${_user.userType.userType ?? ''} | ${_user.username ?? ''}',
                  ),
                  accountEmail: Text(UserService.to.user.value.noIc ?? ''),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_circle,
                      size: 40.0,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Kemaskini Profil'),
                  leading: Icon(Icons.account_circle),
                  onTap: () => Navigator.pushNamed(context, '/profile'),
                ),
                ListTile(
                  title: Text('Pemberitahuan'),
                  leading: Icon(Icons.notifications),
                  onTap: () => Navigator.pushNamed(context, '/notifications'),
                ),
                ListTile(
                  title: Text('Terma & Syarat'),
                  leading: Icon(Icons.zoom_out_map),
                  onTap: () =>
                      Navigator.pushNamed(context, '/term-and-conditions'),
                ),
                ListTile(
                  title: Text('Log Keluar'),
                  leading: Icon(Icons.logout),
                  onTap: () {
                    AuthService.to.logout();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/AdminSignInNew', ModalRoute.withName('/splash'));
                  },
                )
              ],
            ),
          ),
          bottomNavigationBar: hasBottomNavigation ? bottomNavigationBar : null,
          appBar: AppBar(
            title: Image.asset(
              'assets/images/masjid_pro.png',
              height: 150,
              width: 150,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.bar_chart),
                onPressed: () {},
              ),
            ],
          ),
          body: child,
        ),
      ),
    );
  }
}

Widget appDrawerMenu(label, icon) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: Colors.white,
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        label ?? '',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ],
  );
}
