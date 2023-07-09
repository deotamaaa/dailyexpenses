import 'package:dailyexpenses/src/utils/base_client.dart';
import 'package:dailyexpenses/src/utils/routes/app_routes.dart';
import 'package:dailyexpenses/src/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/shared/app_theme.dart';
import 'src/views/login_screen.dart';

class MyApp extends StatelessWidget {
  final baseClient = Get.put(BaseClient());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Expenses',
      getPages: AppRoutes.pages,
      initialRoute: Routes.login,
      theme: AppTheme.appTheme(context),
      home: LoginScreen(),
    );
  }
}
