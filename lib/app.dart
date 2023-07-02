import 'package:dailyexpenses/src/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/views/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Expenses',
      theme: AppTheme.appTheme(context),
      home: LoginScreen(),
    );
  }
}
