import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/core/app_extension.dart';
import 'package:flutter_bits_healthcare_app/core/app_icon.dart';
import 'package:flutter_bits_healthcare_app/src/model/medicine.dart';
import 'package:flutter_bits_healthcare_app/src/view/widget/counter_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/app_color.dart';
import 'package:flutter_bits_healthcare_app/src/controller/medicine_controller.dart';
import 'package:get/get.dart';

import '../widget/scale_animation.dart';

final MedicineController controller = Get.put(MedicineController());

class MedicineDetailScreen extends StatelessWidget {
  const MedicineDetailScreen({Key? key, required this.medicine})
      : super(key: key);

  final Medicine medicine;

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Medicine Detail Screen",
        style: TextStyle(
            color: controller.isLightTheme ? Colors.black : Colors.white),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        )
      ],
    );
  }

  Widget fab(VoidCallback onPressed) {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: LightThemeColor.accent,
      child: medicine.isFavorite
          ? const Icon(AppIcon.heart)
          : const Icon(AppIcon.outlinedHeart),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:
          GetBuilder(builder: (MedicineController medicineController) {
        return fab(() => medicineController.isFavoriteMedicine(medicine));
      }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: SizedBox(
          height: height * 0.5,
          child: Container(
            decoration: BoxDecoration(
              color: controller.isLightTheme
                  ? Colors.white
                  : DarkThemeColor.primaryLight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          itemPadding: EdgeInsets.zero,
                          itemSize: 20,
                          initialRating: medicine.score,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          glow: false,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => const FaIcon(
                            FontAwesomeIcons.solidStar,
                            color: LightThemeColor.yellow,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(width: 15),
                        Text(medicine.score.toString(),
                            style: Theme.of(context).textTheme.subtitle1),
                        const SizedBox(width: 5),
                        Text("(${medicine.voter})",
                            style: Theme.of(context).textTheme.subtitle1)
                      ],
                    ).fadeAnimation(0.4),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${medicine.price}",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(color: LightThemeColor.accent)),
                        GetBuilder(
                          builder: (MedicineController medicineController) {
                            return CounterButton(
                              onIncrementSelected: () =>
                                  medicineController.increaseItem(medicine),
                              onDecrementSelected: () =>
                                  medicineController.decreaseItem(medicine),
                              label: Text(
                                medicine.quantity.toString(),
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            );
                          },
                        )
                      ],
                    ).fadeAnimation(0.6),
                    const SizedBox(height: 15),
                    Text("Description",
                            style: Theme.of(context).textTheme.headline2)
                        .fadeAnimation(0.8),
                    const SizedBox(height: 15),
                    Text(
                      medicine.description,
                      style: Theme.of(context).textTheme.subtitle1,
                    ).fadeAnimation(0.8),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: ElevatedButton(
                              onPressed: () => controller.addToCart(medicine),
                              child: const Text("Add to cart"))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ScaleAnimation(
        child: Center(
          child: Image.asset(
            medicine.image,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
