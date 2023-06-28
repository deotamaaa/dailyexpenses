import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget modalDialogFailed(info) {
  return AlertDialog(
    title: const Text('Gagal'),
    content: Text(info),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('OK'),
      ),
    ],
  );
}

Widget modalDialogSuccess(info) {
  return AlertDialog(
    title: const Text('Berhasil'),
    content: Text(info),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('OK'),
      ),
    ],
  );
}

Widget modalDialogConfirm(info, onPressed) {
  return AlertDialog(
    title: const Text('Konfirmasi'),
    content: Text(info),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Batal'),
      ),
      TextButton(
        onPressed: onPressed,
        child: const Text('OK'),
      ),
    ],
  );
}
