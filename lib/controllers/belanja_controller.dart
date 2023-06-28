import 'dart:convert';

import 'package:dailyexpenses/models/belanja/belanja_model.dart';
import 'package:dailyexpenses/services/belanja_services.dart';
import 'package:dailyexpenses/utils/widgets/modal_dialog.dart';
import 'package:dailyexpenses/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BelanjaController extends GetxController {
  var isLoading = false.obs;
  var belanjaModel = Rxn<BelanjaModel>();

  postBelanja(nama, tanggal, jumlah, pembayaran, userId, kategori) async {
    try {
      var response = await BelanjaServices.postBelanja('api/pengeluaran', {
        "nama": nama,
        "tanggal": tanggal,
        "jumlah": jumlah,
        "pembayaran": pembayaran,
        "user_id": userId,
        "kategori": kategori,
      });
      var res = jsonDecode(response.body);

      if (res['status'] == 'Success') {
        Get.dialog(const Center(child: CircularProgressIndicator()));
        Get.dialog(modalDialogSuccess(res['message'])).then(
          (value) => Get.offAll(() => const HomeScreen()),
        );
      } else {
        Get.dialog(const Center(
          child: Text('Belanjaan Gagal ditambahkan'),
        ));
        Get.back();
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
