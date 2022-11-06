import 'package:flutter_bits_healthcare_app/src/model/medicine.dart';

class MedicineCategory {
  final MedicineType type;
  bool isSelected;

  MedicineCategory(this.type, this.isSelected);
}

class DoctorCategory {
  final Specialisation type;
  bool isSelected;

  DoctorCategory(this.type, this.isSelected);
}

class LabCategory {
  final LabTestType type;
  bool isSelected;

  LabCategory(this.type, this.isSelected);
}
