import 'dart:convert';
import 'dart:io';

import 'package:dailyexpenses/src/models/login_model/login_model.dart';
import 'package:dailyexpenses/src/utils/base_client.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../../utils/auth.dart';

class AuthServices extends GetxService {
  final BaseClient httpClient;
  AuthServices({required this.httpClient});

  Future<LoginModel> login(String email, String password) async {
    try {
      final response = await httpClient.post('/login', {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
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
