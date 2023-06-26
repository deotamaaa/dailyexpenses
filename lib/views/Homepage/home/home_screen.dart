import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome $name to Home Screen'),
      ),
    );
  }
}
