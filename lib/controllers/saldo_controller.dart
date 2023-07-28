import 'dart:convert';

import 'package:dailyexpenses/models/saldo/saldo_model.dart';
import 'package:dailyexpenses/services/saldo_services.dart';
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
}
