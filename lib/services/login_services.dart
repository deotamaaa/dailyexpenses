import 'dart:convert';

import 'package:dailyexpenses/utils/auth.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  static Future login(String pathUrl, Object body) async {
    var url = Auth.baseUrl + pathUrl;

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    return response;
  }

  static Future register(String pathUrl, Object body) async {
    var url = Auth.baseUrl + pathUrl;

    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    return response;
  }
}
