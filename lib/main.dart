import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skilltest/presentation/controller/datacontroller.dart';
import 'package:skilltest/presentation/screen/home_page.dart';

void main() {
  runApp(const MyApp());
  Get.put(DataController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
