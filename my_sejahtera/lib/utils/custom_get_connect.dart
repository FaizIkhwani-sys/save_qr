import 'package:get/get.dart';

import '../data/services/auth_service.dart';
import 'config.dart';
import 'helper.dart';

class CustomGetConnect extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = API_ADDRESS;
    httpClient.addRequestModifier((request) {
      request
        ..headers['Authorization'] = '${AuthService.to.authToken}'
        ..headers['accept'] = 'application/json';
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      if (AuthService.to.isSignIn.value &&
          response.body != null &&
          response.statusCode == 401) {
        print("CustomGetConnect: "
            "${response.statusCode} ${response.statusText}");
        AuthService.to.logout();
      }
      if (response.statusCode == 422) {
        MyHelper().showValidationSnackBar(response);
      }
      if (!response.isOk) {
        print('${response.statusCode}: ${response.body}');
      }
    });
    httpClient.maxAuthRetries = 3;
  }
}
