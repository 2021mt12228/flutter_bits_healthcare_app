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

class UnderConstructionDetailScreen extends StatelessWidget {
  const UnderConstructionDetailScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
        title: Text(
      "Under Construction Screen",
      style: TextStyle(
          color: controller.isLightTheme ? Colors.black : Colors.white),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
                        )
                      ],
                    ).fadeAnimation(0.4),
                    const SizedBox(height: 15),
                    const SizedBox(height: 15),
                    Text("Description",
                            style: Theme.of(context).textTheme.headline2)
                        .fadeAnimation(0.8),
                    const SizedBox(height: 15),
                    Text(
                      "Under Construction",
                      style: Theme.of(context).textTheme.subtitle1,
                    ).fadeAnimation(0.8),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ScaleAnimation(
        child: Center(
          child: Text(
            "Under Construction",
            style: Theme.of(context).textTheme.subtitle1,
          ).fadeAnimation(0.8),
        ),
      ),
    );
  }
}
