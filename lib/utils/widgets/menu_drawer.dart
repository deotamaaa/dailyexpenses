import 'package:dailyexpenses/utils/widgets/modal_dialog.dart';
import 'package:dailyexpenses/views/belanja/belanja_screen.dart';
import 'package:dailyexpenses/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xffFF6600),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.person),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Buat Belanjaan'),
            onTap: () {
              Get.to(() => const BelanjaScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add),
            title: const Text('Buat Catatan'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Get.dialog(modalDialogConfirm('Apakah anda ingin keluar?', () {
                Get.offAll(
                  () => LoginScreen(),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}
