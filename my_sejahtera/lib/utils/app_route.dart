import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:masjid_pro/app/modules/home_admin/view/home_admin_bendahari.dart';
import 'package:masjid_pro/app/modules/home_admin/view/home_admin_masjid/masjid_home_page/masjid_home_page.dart';
import 'package:masjid_pro/app/modules/home_admin/view/home_admin_pejabat.dart';

class AppRoute {
  static Future<T> push<T extends Object>(
    BuildContext context,
    Widget page, {
    bool fadePage = false,
  }) {
    return Navigator.of(context).push(
      fadePage
          ? FadePageAnimition(page)
          : CupertinoPageRoute(builder: (context) => page),
    );
  }

  static Future<T> pushModal<T extends Object>(
      BuildContext context, Route<T> modal) {
    return Navigator.of(context).push(modal);
  }

  @optionalTypeArgs
  static Future<T> pushReplacement<T extends Object, TO extends Object>(
    BuildContext context,
    Widget page, {
    bool fadePage = false,
    TO result,
  }) {
    return Navigator.of(context).pushReplacement<T, TO>(
      fadePage
          ? FadePageAnimition(page)
          : CupertinoPageRoute(builder: (context) => page),
      result: result,
    );
  }

  @optionalTypeArgs
  static Future<T> pushAndRemoveUntil<T extends Object>(
    BuildContext context,
    Widget page, {
    bool fadePage = false,
  }) {
    return Navigator.of(context).pushAndRemoveUntil<T>(
      fadePage
          ? FadePageAnimition(page)
          : CupertinoPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  @optionalTypeArgs
  static void pop<T extends Object>(BuildContext context, [T result]) {
    Navigator.of(context).pop<T>(result);
  }

  static initializeRoute(String userName) {
    switch (userName) {
      case 'pengerusi':
        Get.offAll(MasjidHomePage());
        break;
      case 'ajk':
        Get.offAll(MasjidHomePage());
        break;
      case 'bendahari':
        Get.offAll(homeBendahari());
        break;
      case 'pegawai':
        Get.offAll(HomeAdminPage());
        break;
      default:
        break;
    }
  }
}

class FadePageAnimition<T> extends PageRoute<T> {
  FadePageAnimition(this.child);
  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);
}
