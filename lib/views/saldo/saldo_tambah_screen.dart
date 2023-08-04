import 'package:dailyexpenses/controllers/saldo_controller.dart';
import 'package:dailyexpenses/shared/extension.dart';
import 'package:dailyexpenses/utils/widgets/widget_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaldoTambah extends StatelessWidget {
  final SaldoController saldoController = Get.find();
  final TextEditingController gopayController = TextEditingController();
  final TextEditingController cashController = TextEditingController();
  final TextEditingController rekeningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Saldo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TOP UP SALDO',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            16.height,
            formInput(
                formName: 'Saldo GOPAY',
                controller: gopayController,
                hint: 'Masukkan GOPAY'),
            formInput(
              formName: 'Saldo CASH',
              controller: cashController,
              hint: 'Masukkan CASH',
            ),
            formInput(
              formName: 'Saldo REKENING',
              controller: rekeningController,
              hint: 'Masukkan REKENING',
            ),
            16.height,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('TOP UP SALDO'),
                onPressed: () {
                  saldoController.postSaldo(
                    gopayController.text,
                    cashController.text,
                    rekeningController.text,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
