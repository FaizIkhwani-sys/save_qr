import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:masjid_pro/app/data/models/notification/notification_counter_model.dart';
import 'package:masjid_pro/app/data/services/auth_service.dart';
import 'package:masjid_pro/app/data/services/firebase_service.dart';
import 'package:masjid_pro/app/data/services/user_service.dart';
import 'package:masjid_pro/generated/locales.g.dart';

class AppDrawer extends StatelessWidget {
  final box = GetStorage('userStorage');
  String token = FirebaseService().token_update().toString().trim();
  String jenis_user = UserService().jenisUser().toString().trim();
  Future<no_noti> nonoti() async {
    String user_id = box.read('userId');

    final jsonEndpoint =
        "https://api.masjidpro.com/lihat_notifikasi?token=$token&jenisUser=$jenis_user&userid=$user_id&noti=2";
    no_noti results = new no_noti();
    final response = await http.get(jsonEndpoint);
    print(jsonEndpoint);

    if (response.statusCode == 200 || json != null) {
      Map jsonParsed = json.decode(response.body);
      results = no_noti.fromJson(jsonParsed);
      return results;
    } else {
      print('Request failed with status: ${response.statusCode}');
      throw Exception('Failed to load post');
    }
  }

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     nonoti();
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {
    Get.find<UserService>();

    return Obx(() {
      return Drawer(
        child: Container(
            child: ListView(
          padding: EdgeInsets.zero,
          children: AuthService.to.isSignIn.value
              ? _buildUserWidgets(context)
              : buildGuestWidgets(context),
        )),
      );
      //   bottomNavigationBar: BuildBottomNavigationBar(),
      // );
    });
  }

  _buildUserWidgets(BuildContext context) {
    return <Widget>[
      UserAccountsDrawerHeader(
        onDetailsPressed: () {
          Get.toNamed('/profile');
        },
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        accountName: Text(
          UserService.to.user.value.userType != null
              ? "${UserService.to.user.value.userType.userType} | ${UserService.to.user.value.username ?? ''}  "
              : "${UserService.to.user.value.namaPenuh ?? ''}",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        accountEmail: Text(
          "${UserService.to.user.value.noIc ?? ''} ",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Theme.of(context).unselectedWidgetColor,
          child: Icon(
            Icons.account_circle,
            size: 40.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      // ListTile(
      //   leading: Icon(
      //     Icons.login,
      //     color: Theme.of(context).secondaryHeaderColor,
      //   ),
      //   title: Text("Log Masuk sebagai anak kariah".tr),
      //   onTap: () {
      //     //Get.off('/sign-in');
      //     // Get.toNamed('/sign-in');
      //     //Get.to(homeScreen());
      //     //Get.toNamed('/splash');
      //   },
      // ),
      ListTile(
        leading: Icon(
          Icons.account_circle,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        title: Text(LocaleKeys.drawer_edit_profile_title.tr),
        onTap: () {
          Get.toNamed('/profile');
        },
      ),
      //buildListnoti(context),
      FutureBuilder(
          future: nonoti(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (AuthService.to.isSignIn.value) {
                return Badge(
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    title: Text(LocaleKeys.notification_title.tr),
                    onTap: () {
                      Get.toNamed('/notifications');
                    },
                  ),
                  badgeContent: Text(snapshot.data.lihatNotifikasi.noNoti),
                  position: BadgePosition.topStart(top: 5, start: 40),
                );
              }
            }
            return ListTile();
          }),
      // ListTile(
      //   leading: Icon(
      //     Icons.notifications,
      //     color: Theme.of(context).secondaryHeaderColor,
      //   ),
      //   title: Text(LocaleKeys.notification_title.tr),
      //   onTap: () {
      //     Get.toNamed('/notifications');
      //   },
      // ),
      ListTile(
        leading: Icon(
          Icons.logout,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        title: Text(LocaleKeys.drawer_sign_out_title.tr),
        onTap: () {
          AuthService.to.logout();
          Navigator.of(context).pushReplacementNamed("/pejabtan-signin");
          //Navigator.of(context).pushNamedAndRemoveUntil('/pejabatan-signin', ModalRoute.withName('/pejabatan-signin'));
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     '/home', ModalRoute.withName('/pejabatan-signin'));
          //Get.to(homeScreen());
          //Get.to(SignInView());
        },
      ),
      _buildSharedWidgets(context),
    ];
  }

  buildListnoti(BuildContext context) {
    return FutureBuilder(
        future: nonoti(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (AuthService.to.isSignIn.value) {
              return Badge(
                child: ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  title: Text(LocaleKeys.notification_title.tr),
                  onTap: () {
                    Get.toNamed('/notifications');
                  },
                ),
                badgeContent: Text(snapshot.data.lihatNotifikasi.noNoti),
                position: BadgePosition.topEnd(top: 4, end: 1),
              );
            }
          }
          return ListTile();
        });
  }

  buildGuestWidgets(BuildContext context) {
    return <Widget>[
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        accountName: Text(
          LocaleKeys.drawer_not_sign_in_title.tr,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        accountEmail: Text(
          LocaleKeys.drawer_not_sign_in_message.tr,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Theme.of(context).unselectedWidgetColor,
          child: Icon(
            Icons.account_circle,
            size: 40.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      ListTile(
        leading: Icon(
          Icons.assignment_ind,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        title: Text(LocaleKeys.drawer_sign_up_title.tr),
        onTap: () {
          Get.toNamed('/parish-sign-up');
        },
      ),
      ListTile(
        leading: Icon(
          Icons.login,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        title: Text("Log Masuk".tr),
        onTap: () {
          //Get.off('/sign-in');
          //Get.toNamed('/sign-in');
          //Get.to(homeScreen());
          //Get.toNamed('/splash');
          Navigator.popUntil(context, ModalRoute.withName('/pejabatan-signin'));
        },
      ),
      _buildSharedWidgets(context),
    ];
  }

  _buildSharedWidgets(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: Icon(
            Icons.list_alt,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          title: Text(LocaleKeys.drawer_terms_and_conditions_title.tr),
          onTap: () {
            Get.toNamed('/term-and-conditions');
          },
        ),
      ],
    );
  }
}
