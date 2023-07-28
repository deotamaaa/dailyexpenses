import 'package:dailyexpenses/utils/auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SaldoServices {
  static Future getSaldo(String pathUrl, Object body) async {
    var url = Auth.baseUrl + pathUrl;
    final Storage = GetStorage();
    var token = Storage.read('token');

    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}
