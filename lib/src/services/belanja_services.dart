import 'dart:convert';

import '../utils/auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BelanjaServices {
  static Future postBelanja(String pathUrl, Object body) async {
    var url = Auth.baseUrl + pathUrl;
    final storage = GetStorage();
    var token = storage.read('token');

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    return response;
  }

  static Future getBelanja(String pathUrl, Object body) async {
    var url = Auth.baseUrl + pathUrl;
    final storage = GetStorage();
    var token = storage.read('token');

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
