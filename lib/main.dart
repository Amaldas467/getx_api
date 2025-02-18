import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Homescreen(),
    );
  }
}
