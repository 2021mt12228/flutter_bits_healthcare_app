import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/core/app_color.dart';
import 'package:flutter_bits_healthcare_app/core/app_extension.dart';
import 'package:flutter_bits_healthcare_app/src/model/medicine.dart';
import 'package:flutter_bits_healthcare_app/src/view/widget/empty_widget.dart';
import 'package:get/get.dart';
import '../../../core/app_icon.dart';
import '../../controller/medicine_controller.dart';

final MedicineController controller = Get.put(MedicineController());

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite screen",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: EmptyWidget(
        type: EmptyWidgetType.favorite,
        title: "Empty favorite",
        condition: controller.favoriteMedicine.isNotEmpty,
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: controller.favoriteMedicine.length,
          itemBuilder: (_, index) {
            Medicine medicine = controller.favoriteMedicine[index];
            return Card(
              color: controller.isLightTheme
                  ? Colors.white
                  : DarkThemeColor.primaryLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Text(medicine.name,
                    style: Theme.of(context).textTheme.headline4),
                leading: Image.asset(medicine.image),
                subtitle: Text(
                  medicine.description,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
              ),
            ).fadeAnimation(index * 0.6);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(padding: EdgeInsets.only(bottom: 15));
          },
        ),
      ),
    );
  }
}
