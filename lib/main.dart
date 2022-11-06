import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/src/controller/medicine_controller.dart';
import 'package:flutter_bits_healthcare_app/src/view/screen/home_screen.dart';
import 'package:get/get.dart';

final MedicineController controller = Get.put(MedicineController());

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: controller.theme.value,
        home: HomeScreen(),
      );
    });
  }
}
