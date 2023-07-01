import 'package:flutter/material.dart';

/// Extension ini digunakan untuk membuat widget SizedBox dengan mudah. contoh: 16.height untuk memanggil sizedbox dengan property height
extension SizedBoxExt on num {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}
