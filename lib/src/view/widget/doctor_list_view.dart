import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/core/app_extension.dart';
import 'package:flutter_bits_healthcare_app/src/view/widget/custom_page_route.dart';
import 'package:get/get.dart';
import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../controller/medicine_controller.dart';
import '../../model/medicine.dart';
import '../screen/under_construction.dart';

final MedicineController controller = Get.put(MedicineController());

class DoctorListView extends StatelessWidget {
  const DoctorListView(
      {Key? key, required this.doctors, this.isReversedList = false})
      : super(key: key);

  final List<Doctor> doctors;
  final bool isReversedList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 20, left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: isReversedList ? 3 : doctors.length,
        itemBuilder: (_, index) {
          Doctor doctor = isReversedList
              ? doctors.reversed.toList()[index]
              : doctors[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CustomPageRoute(
                  child: UnderConstructionDetailScreen(),
                ),
              );
            },
            child: Container(
              width: 160,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: controller.isLightTheme
                      ? Colors.white
                      : DarkThemeColor.primaryLight,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      doctor.image,
                      scale: 6,
                    ),
                    Text("\$${doctor.fees}",
                        style: h3Style.copyWith(color: LightThemeColor.accent)),
                    Text(doctor.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ).fadeAnimation(0.7),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(padding: EdgeInsets.only(right: 50));
        },
      ),
    );
  }
}
