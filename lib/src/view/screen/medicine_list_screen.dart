import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/core/app_color.dart';
import 'package:flutter_bits_healthcare_app/core/app_data.dart';
import 'package:flutter_bits_healthcare_app/core/app_extension.dart';
import 'package:flutter_bits_healthcare_app/src/model/medicine_category.dart';
import 'package:get/get.dart';
import '../../controller/medicine_controller.dart';
import '../widget/doctor_list_view.dart';
import '../widget/medicine_list_view.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/lab_list_view.dart';

final MedicineController controller = Get.put(MedicineController());

class MedicineListScreen extends StatelessWidget {
  const MedicineListScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.userDoctor),
        onPressed: controller.changeTheme,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.health_and_safety, color: LightThemeColor.accent),
          Text("BITS Health Care", style: Theme.of(context).textTheme.bodyText1)
        ],
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: Badge(
      //       badgeColor: LightThemeColor.accent,
      //       badgeContent:
      //           const Text("2", style: TextStyle(color: Colors.white)),
      //       position: BadgePosition.topStart(start: -3),
      //       child: const Icon(Icons.notifications_none, size: 30),
      //     ),
      //   )
      // ],
    );
  }

  Widget _searchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      // child: TextField(
      //   decoration: InputDecoration(
      //     hintText: 'Search food',
      //     prefixIcon: Icon(Icons.search, color: Colors.grey),
      //     contentPadding: EdgeInsets.all(20),
      //   ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Morning, BITS",
                      style: Theme.of(context).textTheme.headline5)
                  .fadeAnimation(0.2),
              Text("How do you feel Today",
                      style: Theme.of(context).textTheme.headline1)
                  .fadeAnimation(0.4),
              _searchBar(),
              Text("Book Doctor Appointments",
                  style: Theme.of(context).textTheme.headline3),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 40,
                  child: GetBuilder(
                    builder: (MedicineController controller) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: AppData.doctorCategories.length,
                        itemBuilder: (_, index) {
                          DoctorCategory category =
                              AppData.doctorCategories[index];
                          return GestureDetector(
                            onTap: () {
                              controller.filterItemByDoctorCategory(category);
                            },
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: category.isSelected
                                    ? LightThemeColor.accent
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                category.type.name.toCapital,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Padding(
                              padding: EdgeInsets.only(right: 15));
                        },
                      );
                    },
                  ),
                ),
              ),
              GetBuilder(
                builder: (MedicineController controller) {
                  return DoctorListView(doctors: controller.filteredDoctors);
                },
              ),
              Padding(padding: const EdgeInsets.only(top: 15)),
              Text("Book Lab Appointments",
                  style: Theme.of(context).textTheme.headline3),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 40,
                  child: GetBuilder(
                    builder: (MedicineController controller) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: AppData.labCategories.length,
                        itemBuilder: (_, index) {
                          LabCategory category = AppData.labCategories[index];
                          return GestureDetector(
                            onTap: () {
                              controller.filterItemByLabCategory(category);
                            },
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: category.isSelected
                                    ? LightThemeColor.accent
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                category.type.name.toCapital,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Padding(
                              padding: EdgeInsets.only(right: 15));
                        },
                      );
                    },
                  ),
                ),
              ),
              GetBuilder(
                builder: (MedicineController controller) {
                  return LabListView(labtests: controller.filteredLabs);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Medicines",
                        style: Theme.of(context).textTheme.headline3),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("See all",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: LightThemeColor.accent)),
                    ),
                  ],
                ),
              ),
              MedicineListView(
                  medicines: AppData.medicineItems, isReversedList: true),
            ],
          ),
        ),
      ),
    );
  }
}
