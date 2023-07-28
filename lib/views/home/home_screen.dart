import 'package:dailyexpenses/controllers/belanja_controller.dart';
import 'package:dailyexpenses/controllers/saldo_controller.dart';
import 'package:dailyexpenses/shared/extension.dart';
import 'package:dailyexpenses/utils/spacers.dart';
import 'package:dailyexpenses/utils/widgets/menu_drawer.dart';
import 'package:dailyexpenses/utils/widgets/tipe_deposit.dart';
import 'package:dailyexpenses/views/belanja/belanja_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SaldoController saldoController = Get.put(SaldoController());
  final BelanjaController belanjaController = Get.put(BelanjaController());

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    setState(() {
      Future.delayed(Duration(milliseconds: 5000));
      _refreshController.refreshCompleted();
      saldoController.getSaldo();
    });
  }

  String name = "";

  @override
  void initState() {
    super.initState();
    getLocalStorage();
  }

  getLocalStorage() async {
    final storage = GetStorage();
    setState(() {
      name = storage.read('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(title: const Text('Dashboard')),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_outlined))
                ],
              ),
              spaceHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Saldo Deposit',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      const Text('Top Up Saldo'),
                      const Icon(Icons.add),
                    ]),
                  ),
                ],
              ),
              spaceHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () {
                      final saldoModel = saldoController.saldoModel.value;
                      if (saldoModel != null) {
                        return TipeDeposit(
                          'GOPAY',
                          saldoController.saldoModel.value!.data.uangGopay
                              .toString(),
                        );
                      } else {
                        return Text('0');
                      }
                    },
                  ),
                  16.width,
                  Obx(
                    () {
                      final saldoModel = saldoController.saldoModel.value;
                      if (saldoModel != null) {
                        return TipeDeposit(
                          'CASH',
                          saldoController.saldoModel.value!.data.uangCash
                              .toString(),
                        );
                      } else {
                        return Text('0');
                      }
                    },
                  ),
                  16.width,
                  Obx(
                    () {
                      final saldoModel = saldoController.saldoModel.value;
                      if (saldoModel != null) {
                        return TipeDeposit(
                          'REKENING',
                          saldoController.saldoModel.value!.data.uangRekening
                              .toString(),
                        );
                      } else {
                        return Text('0');
                      }
                    },
                  ),
                ],
              ),
              spaceHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest Purchase...',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const BelanjaAllListScreen());
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),
              spaceHeight(),
              Expanded(
                child: Obx(
                  () => belanjaController.isLoading.value == true
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: belanjaController.belanjaList.length > 4
                              ? 4
                              : belanjaController.belanjaList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10.0),
                              color: Colors.grey[200],
                              child: ListTile(
                                title: Text(
                                    belanjaController.belanjaList[index].nama),
                                subtitle: Text(belanjaController
                                    .belanjaList[index].tanggal),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(belanjaController
                                        .belanjaList[index].jumlah
                                        .toString()),
                                    Text(belanjaController
                                        .belanjaList[index].pembayaran),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
