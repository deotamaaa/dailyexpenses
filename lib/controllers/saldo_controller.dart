import 'dart:convert';

import 'package:dailyexpenses/models/saldo/saldo_model.dart';
import 'package:dailyexpenses/services/saldo_services.dart';
import 'package:dailyexpenses/utils/widgets/modal_dialog.dart';
import 'package:dailyexpenses/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SaldoController extends GetxController {
  var saldoModel = Rxn<SaldoModel>();
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getSaldo();
  }

  void getSaldo() async {
    try {
      var userId = storage.read('id');
      var response = await SaldoServices.getSaldo('/api/saldo/$userId', {});
      var res = jsonDecode(response.body);

      saldoModel.value =
          res['status'] == 'Success' ? SaldoModel.fromJson(res) : null;
    } catch (e) {
      saldoModel.value = null;
    }
  }

  postSaldo(uangGopay, uangCash, uangRekening) async {
    try {
      var userId = storage.read('id');
      var response = await SaldoServices.postSaldo('/api/topup/$userId', {
        "id": userId,
        "uang_gopay": uangGopay,
        "uang_cash": uangCash,
        "uang_rekening": uangRekening
      });
      var res = jsonDecode(response.body);

      if (res['status'] == 'Success') {
        Get.dialog(const Center(child: CircularProgressIndicator()));
        Get.dialog(modalDialogSuccess(res['message'])).then(
          (value) => Get.offAll(() => const HomeScreen()),
        );
      } else {
        print(res);
        Get.back();
        return null;
      }
    } catch (e) {}
  }
}
