import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/src/model/medicine.dart';
import 'package:flutter_bits_healthcare_app/src/model/medicine_category.dart';
import 'package:get/get.dart';
import '../../core/app_data.dart';
import '../../core/app_theme.dart';
import '../../core/app_extension.dart';

class MedicineController extends GetxController {
  RxInt currentBottomNavItemIndex = 0.obs;
  RxList<Medicine> cartMedicine = <Medicine>[].obs;
  RxList<Medicine> favoriteMedicine = <Medicine>[].obs;
  RxList<MedicineCategory> categories = AppData.categories.obs;
  RxList<Medicine> filteredMedicines = AppData.medicineItems.obs;
  RxList<Doctor> filteredDoctors = AppData.doctorItems.obs;
  RxList<LabTest> filteredLabs = AppData.labItems.obs;
  RxDouble totalPrice = 0.0.obs;
  RxDouble subtotalPrice = 0.0.obs;
  Rx<ThemeData> theme = AppTheme.lightTheme.obs;
  bool isLightTheme = true;

  void switchBetweenBottomNavigationItems(int currentIndex) {
    currentBottomNavItemIndex.value = currentIndex;
  }

  void increaseItem(Medicine medicine) {
    medicine.quantity++;
    update();
    calculateTotalPrice();
  }

  void decreaseItem(Medicine medicine) {
    medicine.quantity = medicine.quantity-- < 1 ? 0 : medicine.quantity--;
    calculateTotalPrice();
    update();
    if (medicine.quantity < 1) {
      cartMedicine.removeWhere((element) => element == medicine);
    }
  }

  String calculatePricePerEachItem(Medicine medicine) {
    double price = 0;
    price = medicine.quantity * medicine.price;
    return price.toString();
  }

  calculateTotalPrice() {
    totalPrice.value = 5;
    for (var element in cartMedicine) {
      totalPrice.value += element.quantity * element.price;
    }

    subtotalPrice.value = 0;
    if (totalPrice.value > 0) {
      subtotalPrice.value = totalPrice.value - 5;
    }
  }

  addToCart(Medicine medicine) {
    if (medicine.quantity > 0) {
      cartMedicine.add(medicine);
      cartMedicine.assignAll(cartMedicine.distinctBy((item) => item));
      calculateTotalPrice();
    }
  }

  filterItemByCategory(MedicineCategory category) {
    for (var element in AppData.categories) {
      element.isSelected = false;
    }
    category.isSelected = true;

    if (category.type == MedicineType.all) {
      filteredMedicines.assignAll(AppData.medicineItems.obs);
    } else {
      filteredMedicines.assignAll(AppData.medicineItems.where((item) {
        return item.type == category.type;
      }).toList());
    }
    update();

    filteredMedicines.refresh();
  }

  filterItemByDoctorCategory(DoctorCategory category) {
    for (var element in AppData.doctorCategories) {
      element.isSelected = false;
    }
    category.isSelected = true;

    if (category.type == MedicineType.all) {
      filteredDoctors.assignAll(AppData.doctorItems.obs);
    } else {
      filteredDoctors.assignAll(AppData.doctorItems.where((item) {
        return item.type == category.type;
      }).toList());
    }
    update();

    filteredDoctors.refresh();
  }

  filterItemByLabCategory(LabCategory category) {
    for (var element in AppData.labCategories) {
      element.isSelected = false;
    }
    category.isSelected = true;

    if (category.type == MedicineType.all) {
      filteredLabs.assignAll(AppData.labItems.obs);
    } else {
      filteredLabs.assignAll(AppData.labItems.where((item) {
        return item.type == category.type;
      }).toList());
    }
    update();

    filteredLabs.refresh();
  }

  isFavoriteMedicine(Medicine medicine) {
    medicine.isFavorite = !medicine.isFavorite;
    update();
    if (medicine.isFavorite) {
      favoriteMedicine.add(medicine);
    }
    if (!medicine.isFavorite) {
      favoriteMedicine.removeWhere((element) => element == medicine);
    }
  }

  removeCartItemAtSpecificIndex(int index) {
    cartMedicine.removeAt(index);
    calculateTotalPrice();
    update();
  }

  void changeTheme() {
    if (theme.value == AppTheme.darkTheme) {
      theme.value = AppTheme.lightTheme;
      isLightTheme = true;
    } else {
      theme.value = AppTheme.darkTheme;
      isLightTheme = false;
    }
  }
}
