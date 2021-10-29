import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:masjid_pro/app/data/repository/repository_service.dart';

class AppInitiliaze {
  static Future initLibrary() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    await GetStorage.init('authStorage');
    await GetStorage.init('userStorage');
    Get.put(RepositoryService());

    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
  }
}
