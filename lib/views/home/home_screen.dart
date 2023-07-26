import 'package:dailyexpenses/controllers/belanja_controller.dart';
import 'package:dailyexpenses/utils/spacers.dart';
import 'package:dailyexpenses/utils/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BelanjaController controller = Get.put(BelanjaController());

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
      body: Padding(
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
                    onPressed: () {}, icon: Icon(Icons.notifications_outlined))
              ],
            ),
            spaceHeight(),
            const Text(
              'Latest Purchase...',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            spaceHeight(),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.belanjaList.length > 4
                            ? 4
                            : controller.belanjaList.length,
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
        ),
      ),
    );
  }
}
