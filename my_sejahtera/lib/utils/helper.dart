import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file/open_file.dart';

import 'package:masjid_pro/generated/locales.g.dart';

class MyHelper {
  void showValidationSnackBar(dynamic response) {
    Map<String, dynamic> errors = response.body["errors"];
    var errorMessage = "";
    if (errors != null) {
      SystemSound.play(SystemSoundType.alert);
      errors.forEach((index, value) {
        String stringWithoutBrackets =
            value.toString().replaceAll(new RegExp(r'[^\w\s]+'), '');
        errorMessage += '\n \u26A0 ' + stringWithoutBrackets + ". \n ";
      });
    }
    Get.snackbar(response.body["message"], errorMessage,
        duration: Duration(seconds: 30),
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white);
  }

  Widget imageFromBase64String(String base64String) {
    Widget content;
    bool success = false;

    try {
      content = Image.memory(base64Decode(base64String));
      success = true;
    } catch (e) {
      print(e);
      print("imageFromBase64String: base64String not jpeg!");
      print("$base64String");
      success = false;
    }

    // If still not success, display failed to load
    if (!success) {
      content = Container(
          alignment: Alignment.center,
          child: Text(
            LocaleKeys.snackbar_file_format_invalid.tr,
            textAlign: TextAlign.center,
          ));
    }
    Widget scaffold = Scaffold(
        appBar: AppBar(
          title: Text(success
              ? LocaleKeys.snackbar_file.tr
              : LocaleKeys.snackbar_error_title.tr),
          centerTitle: true,
        ),
        body: content
        // bottomNavigationBar: _buildBottomNavigationBar(context),
        );

    return scaffold;
  }

  createPdf(base64String) async {
    try {
      var bytes = base64Decode(base64String.replaceAll('\n', ''));
      final output = await getTemporaryDirectory();
      final file = File("${output.path}/example.pdf");
      await file.writeAsBytes(bytes.buffer.asUint8List());
      await OpenFile.open("${output.path}/example.pdf");
    } catch (e) {
      print(e);
      print("createPdf: base64String not pdf!");
      print("$base64String");
    }
  }

  showSnackBar(
    String title,
    String message, {

    Duration duration = const Duration(seconds: 15),
    Color colorText,
    bool instantInit = true,
    SnackPosition snackPosition,
    Widget titleText,
    Widget messageText,
    Widget icon,
    bool shouldIconPulse,
    double maxWidth,
    EdgeInsets margin,
    EdgeInsets padding,
    double borderRadius,
    Color borderColor,
    double borderWidth,
    Color backgroundColor,
    Color leftBarIndicatorColor,
    List<BoxShadow> boxShadows,
    Gradient backgroundGradient,
    FlatButton mainButton,
    OnTap onTap,
    bool isDismissible,
    bool showProgressIndicator,
    SnackDismissDirection dismissDirection,
    AnimationController progressIndicatorController,
    Color progressIndicatorBackgroundColor,
    Animation<Color> progressIndicatorValueColor,
    SnackStyle snackStyle,
    Curve forwardAnimationCurve,
    Curve reverseAnimationCurve,
    Duration animationDuration,
    double barBlur,
    double overlayBlur,
    SnackbarStatusCallback snackbarStatus,
    Color overlayColor,
    Form userInputForm,


  }) {

    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        duration: duration,
        colorText: colorText,
        snackbarStatus: snackbarStatus,
        titleText: titleText,
        messageText: messageText,
        snackPosition: snackPosition,
        borderRadius: borderRadius,
        margin: margin,
        barBlur: barBlur,
        backgroundColor: backgroundColor,
        icon: icon,
        shouldIconPulse: shouldIconPulse,
        maxWidth: maxWidth,
        padding: padding,
        borderColor: borderColor,
        borderWidth: borderWidth,
        leftBarIndicatorColor: leftBarIndicatorColor,
        boxShadows: boxShadows,
        backgroundGradient: backgroundGradient,
        mainButton: mainButton,
        onTap: onTap,
        isDismissible: isDismissible,
        dismissDirection: dismissDirection,
        showProgressIndicator: showProgressIndicator ?? false,
        progressIndicatorController: progressIndicatorController,
        progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
        progressIndicatorValueColor: progressIndicatorValueColor,
        snackStyle: snackStyle,
        forwardAnimationCurve: forwardAnimationCurve,
        reverseAnimationCurve: reverseAnimationCurve,
        animationDuration: animationDuration,
        overlayBlur: overlayBlur,
        overlayColor: overlayColor,
        userInputForm: userInputForm,


      );
    } else {

      Get.back();
      Get.snackbar(
        title,
        message,
        duration: duration,
        colorText: colorText,
        snackbarStatus: snackbarStatus,
        titleText: titleText,
        messageText: messageText,
        snackPosition: snackPosition,
        borderRadius: borderRadius,
        margin: margin,
        barBlur: barBlur,
        backgroundColor: backgroundColor,
        icon: icon,
        shouldIconPulse: shouldIconPulse,
        maxWidth: maxWidth,
        padding: padding,
        borderColor: borderColor,
        borderWidth: borderWidth,
        leftBarIndicatorColor: leftBarIndicatorColor,
        boxShadows: boxShadows,
        backgroundGradient: backgroundGradient,
        mainButton: mainButton,
        onTap: onTap,
        isDismissible: isDismissible,
        dismissDirection: dismissDirection,
        showProgressIndicator: showProgressIndicator ?? false,
        progressIndicatorController: progressIndicatorController,
        progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
        progressIndicatorValueColor: progressIndicatorValueColor,
        snackStyle: snackStyle,
        forwardAnimationCurve: forwardAnimationCurve,
        reverseAnimationCurve: reverseAnimationCurve,
        animationDuration: animationDuration,
        overlayBlur: overlayBlur,
        overlayColor: overlayColor,
        userInputForm: userInputForm,
      );
    }
  }
}
