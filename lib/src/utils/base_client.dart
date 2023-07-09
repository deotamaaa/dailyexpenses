import 'package:get/get.dart';

class BaseClient extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://dailycost.my.id';
    httpClient.addRequestModifier<void>((request) {
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
  }
}
