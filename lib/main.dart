import 'package:dailyexpenses/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Expenses',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xffFF6600),
              secondary: const Color(0xffFF6600),
            ),
      ),
      home: LoginScreen(),
    );
  }
}
