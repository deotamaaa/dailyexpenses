import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set the desired status bar color
    statusBarBrightness:
        Brightness.dark, // Set the status bar text color to dark
    statusBarIconBrightness: Brightness.dark,
  ));
  await GetStorage.init();
  runApp(MyApp());
}
