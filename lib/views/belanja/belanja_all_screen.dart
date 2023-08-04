import 'package:dailyexpenses/controllers/belanja_controller.dart';
import 'package:dailyexpenses/shared/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BelanjaAllListScreen extends StatefulWidget {
  const BelanjaAllListScreen({super.key});

  @override
  State<BelanjaAllListScreen> createState() => _BelanjaAllListScreenState();
}

class _BelanjaAllListScreenState extends State<BelanjaAllListScreen> {
  final BelanjaController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Belanjaan'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Container(
            child: Column(
          children: [
            SearchBar(
              leading: Icon(Icons.search),
            ),
            16.height,
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.belanjaList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            color: Colors.grey[200],
                            child: ListTile(
                              title: Text(controller.belanjaList[index].nama),
                              subtitle:
                                  Text(controller.belanjaList[index].tanggal),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.belanjaList[index].jumlah
                                      .toString()),
                                  Text(
                                      controller.belanjaList[index].pembayaran),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
