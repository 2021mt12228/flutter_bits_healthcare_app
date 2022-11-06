import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/src/view/screen/cart_screen.dart';
import 'package:flutter_bits_healthcare_app/src/view/screen/favorite_screen.dart';
import 'package:flutter_bits_healthcare_app/src/view/screen/medicine_list_screen.dart';
import 'package:flutter_bits_healthcare_app/src/view/screen/profile_screen.dart';
import '../../../core/app_data.dart';
import '../../controller/medicine_controller.dart';
import 'package:get/get.dart';

import '../widget/page_transition.dart';

final MedicineController controller = Get.put(MedicineController());

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> screen = [
    const MedicineListScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageTransition(
          child: screen[controller.currentBottomNavItemIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentBottomNavItemIndex.value,
          onTap: controller.switchBetweenBottomNavigationItems,
          selectedFontSize: 0,
          items: AppData.bottomNavigationItems.map(
            (element) {
              return BottomNavigationBarItem(
                  icon: element.disableIcon,
                  label: element.label,
                  activeIcon: element.enableIcon);
            },
          ).toList(),
        );
      }),
    );
  }
}
