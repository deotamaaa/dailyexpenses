import '../../controllers/belanja_controller.dart';
import '../../shared/extension.dart';
import '../../widgets/widget_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BelanjaScreen extends StatefulWidget {
  const BelanjaScreen({super.key});

  @override
  State<BelanjaScreen> createState() => _BelanjaScreenState();
}

class _BelanjaScreenState extends State<BelanjaScreen> {
  final BelanjaController controller = Get.put(BelanjaController());

  final TextEditingController namaBarangController = TextEditingController();
  final TextEditingController tanggalBeliController = TextEditingController();
  final TextEditingController jumlahBeliController = TextEditingController();
  final TextEditingController pembayaranController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();

  int userId = 0;
  String token = '';
  String namaBarang = '';
  String tanggalBeli = '';
  int jumlahBeli = 0;
  String pembayaran = '';
  String kategori = '';

  @override
  void initState() {
    super.initState();
    getLocalStorage();
  }

  getLocalStorage() async {
    final storage = GetStorage();
    setState(() {
      userId = storage.read('id');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Belanjaan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ini Buat Belanjaan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            16.height,
            formInput(
              formName: 'Nama Barang',
              controller: namaBarangController,
              hint: 'Masukkan Nama Barang',
            ),
            16.height,
            formInput(
              formName: 'Tanggal Pembelian',
              controller: tanggalBeliController,
              hint: 'Masukkan Tanggal Pembelian',
            ),
            16.height,
            formInput(
              formName: 'Jumlah Pembelian',
              controller: jumlahBeliController,
              hint: 'Masukkan Jumlah Pembelian',
            ),
            16.height,
            formInput(
              formName: 'Pembayaran',
              controller: pembayaranController,
              hint: 'Masukkan Pembayaran',
            ),
            16.height,
            formInput(
              formName: 'Kategori',
              controller: kategoriController,
              hint: 'Masukkan Kategori',
            ),
            16.height,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Buat Belanjaan'),
                onPressed: () {
                  controller.postBelanja(
                    namaBarangController.text,
                    tanggalBeliController.text,
                    jumlahBeliController.text,
                    pembayaranController.text,
                    userId,
                    kategoriController.text,
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
