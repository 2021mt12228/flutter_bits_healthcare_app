import 'package:flutter/material.dart';
import 'package:flutter_bits_healthcare_app/core/app_asset.dart';
import 'package:flutter_bits_healthcare_app/src/model/medicine_category.dart';
import '../src/model/bottom_navigation_item.dart';
import '../src/model/medicine.dart';

import 'app_icon.dart';

class AppData {
  const AppData._();

  static const dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  static List<Medicine> medicineItems = [
    Medicine(AppAsset.syringe, "Syringe", 10.0, 1, false, dummyText, 5.0,
        MedicineType.syringe, 150),
    Medicine(AppAsset.syrup, "Cold Syrup", 15.0, 1, false, dummyText, 3.5,
        MedicineType.syrup, 652),
    Medicine(AppAsset.capsule, "Capsule", 20.0, 1, false, dummyText, 4.0,
        MedicineType.capsule, 723),
    Medicine(AppAsset.drops, "Colicaid", 40.0, 1, false, dummyText, 2.5,
        MedicineType.drops, 456),
    Medicine(AppAsset.tablets, "Lymcee", 10.0, 1, false, dummyText, 4.5,
        MedicineType.tablets, 650),
    Medicine(AppAsset.capsule2, "Another Capsule", 20.0, 1, false, dummyText,
        1.5, MedicineType.capsule, 350),
    Medicine(AppAsset.tablets2, "Dolo 650", 12.0, 1, false, dummyText, 3.5,
        MedicineType.tablets, 265),
    Medicine(AppAsset.syrup2, "Cough Syrup", 30.0, 1, false, dummyText, 4.0,
        MedicineType.syrup, 890),
    Medicine(AppAsset.drops2, "Paracetamol", 10.0, 1, false, dummyText, 5.0,
        MedicineType.drops, 900),
    Medicine(AppAsset.syringe2, "Insulin", 15.0, 1, false, dummyText, 3.5,
        MedicineType.syringe, 420),
    Medicine(AppAsset.syrup3, "Zinconia", 25.0, 1, false, dummyText, 3.0,
        MedicineType.syrup, 263),
    Medicine(AppAsset.syrup4, "Kufgic Cold", 20.0, 1, false, dummyText, 5.0,
        MedicineType.syrup, 560),
  ];

  static List<Doctor> doctorItems = [
    Doctor(AppAsset.doctor2, "Sushil Kumar", 10.0, false, dummyText,
        Specialisation.general),
    Doctor(AppAsset.doctor3, "Kumar Yadav", 15.0, false, dummyText,
        Specialisation.ortho),
    Doctor(AppAsset.doctor4, "Raj Shetty", 20.0, false, dummyText,
        Specialisation.diabetes),
    Doctor(AppAsset.doctor5, "Saahil Khan", 40.0, false, dummyText,
        Specialisation.dentist),
    Doctor(AppAsset.doctor6, "Sandeep Bhattacharya", 10.0, false, dummyText,
        Specialisation.cardiologist),
    Doctor(AppAsset.doctor7, "Yatinder Sharma", 20.0, false, dummyText,
        Specialisation.gastrologist),
    Doctor(AppAsset.doctor8, "Sohail Khadi", 12.0, false, dummyText,
        Specialisation.general),
    Doctor(AppAsset.doctor9, "Arsalan Ahmed", 30.0, false, dummyText,
        Specialisation.ortho),
    Doctor(AppAsset.doctor1, "Neelima Gupta", 10.0, false, dummyText,
        Specialisation.dentist),
    Doctor(AppAsset.doctor10, "Sanyal Rawal", 15.0, false, dummyText,
        Specialisation.cardiologist),
  ];

  static List<LabTest> labItems = [
    LabTest(AppAsset.eeg, "EEG", 10.0, dummyText, LabTestType.neuro),
    LabTest(AppAsset.ecg, "ECG", 15.0, dummyText, LabTestType.cardio),
    LabTest(
        AppAsset.ultrasound, "Ultrasound", 20.0, dummyText, LabTestType.gastro),
    LabTest(AppAsset.lungs, "Chest Scan", 40.0, dummyText, LabTestType.lungs),
    LabTest(AppAsset.cbp, "CBP", 10.0, dummyText, LabTestType.blood),
    LabTest(
        AppAsset.diabetes, "diabetes", 20.0, dummyText, LabTestType.general),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
        const Icon(Icons.home_outlined), const Icon(Icons.home), 'Home',
        isSelected: true),
    BottomNavigationItem(const Icon(Icons.shopping_cart_outlined),
        const Icon(Icons.shopping_cart), 'Shopping cart'),
    BottomNavigationItem(const Icon(AppIcon.outlinedHeart),
        const Icon(Icons.search), 'Favorite'),
    BottomNavigationItem(
        const Icon(Icons.person_outline), const Icon(Icons.person), 'Profile')
  ];

  static List<MedicineCategory> categories = [
    MedicineCategory(MedicineType.all, true),
    MedicineCategory(MedicineType.syringe, false),
    MedicineCategory(MedicineType.syrup, false),
    MedicineCategory(MedicineType.drops, false),
    MedicineCategory(MedicineType.tablets, false),
    MedicineCategory(MedicineType.capsule, false),
  ];

  static List<DoctorCategory> doctorCategories = [
    DoctorCategory(Specialisation.general, true),
    DoctorCategory(Specialisation.cardiologist, false),
    DoctorCategory(Specialisation.dentist, false),
    DoctorCategory(Specialisation.diabetes, false),
    DoctorCategory(Specialisation.ortho, false),
    DoctorCategory(Specialisation.gastrologist, false),
  ];

  static List<LabCategory> labCategories = [
    LabCategory(LabTestType.general, true),
    LabCategory(LabTestType.cardio, false),
    LabCategory(LabTestType.neuro, false),
    LabCategory(LabTestType.blood, false),
    LabCategory(LabTestType.lungs, false),
    LabCategory(LabTestType.gastro, false),
  ];
}
