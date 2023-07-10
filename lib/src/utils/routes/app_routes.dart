import 'package:dailyexpenses/src/controllers/auth_bindings.dart';
import 'package:dailyexpenses/src/utils/routes/routes.dart';
import 'package:dailyexpenses/src/views/home/home_screen.dart';
import 'package:dailyexpenses/src/views/login_screen.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
  ];
}
