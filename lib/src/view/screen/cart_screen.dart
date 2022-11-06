import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/core/app_color.dart';
import 'package:flutter_bits_healthcare_app/core/app_extension.dart';
import 'package:flutter_bits_healthcare_app/src/view/widget/counter_button.dart';
import 'package:flutter_bits_healthcare_app/src/view/widget/empty_widget.dart';
import 'package:get/get.dart';
import '../../../core/app_style.dart';
import '../../controller/medicine_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final MedicineController controller = Get.put(MedicineController());

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Cart screen",
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _bottomAppBar(double height, double width, BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: height * 0.32,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal",
                            style: Theme.of(context).textTheme.headline5),
                        Obx(() {
                          return Text("\$${controller.subtotalPrice.value}",
                              style: Theme.of(context).textTheme.headline2);
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Taxes",
                            style: Theme.of(context).textTheme.headline5),
                        Text("\$${5.00}",
                            style: Theme.of(context).textTheme.headline2),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      thickness: 4.0,
                      height: 30.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: Theme.of(context).textTheme.headline2),
                        Obx(() {
                          return Text(
                            controller.totalPrice.value == 5.0
                                ? "\$0.0"
                                : "\$${controller.totalPrice}",
                            style:
                                h2Style.copyWith(color: LightThemeColor.accent),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("Checkout"))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cartListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      shrinkWrap: true,
      itemCount: controller.cartMedicine.length,
      itemBuilder: (_, index) {
        return Dismissible(
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              controller.removeCartItemAtSpecificIndex(index);
            }
          },
          key: Key(controller.cartMedicine[index].name),
          background: Row(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: const FaIcon(FontAwesomeIcons.trash)),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: controller.isLightTheme
                  ? Colors.white
                  : DarkThemeColor.primaryLight,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 20),
                Image.asset(controller.cartMedicine[index].image, scale: 10),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.cartMedicine[index].name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${controller.cartMedicine[index].price}",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    CounterButton(
                      onIncrementSelected: () => controller
                          .increaseItem(controller.cartMedicine[index]),
                      onDecrementSelected: () => controller
                          .decreaseItem(controller.cartMedicine[index]),
                      size: const Size(24, 24),
                      padding: 0,
                      label: Text(
                        controller.cartMedicine[index].quantity.toString(),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Text(
                      "\$${controller.calculatePricePerEachItem(controller.cartMedicine[index])}",
                      style: h2Style.copyWith(color: LightThemeColor.accent),
                    )
                  ],
                )
              ],
            ),
          ).fadeAnimation(index * 0.6),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(padding: EdgeInsets.all(10));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: controller.cartMedicine.isNotEmpty
          ? _bottomAppBar(height, width, context)
          : const SizedBox(),
      appBar: _appBar(context),
      body: EmptyWidget(
        title: "Empty cart",
        condition: controller.cartMedicine.isNotEmpty,
        child: SingleChildScrollView(
          child: SizedBox(
            height: height * 0.5,
            child: GetBuilder(
              builder: (MedicineController controller) {
                return cartListView(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
