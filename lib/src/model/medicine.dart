enum MedicineType { all, syrup, drops, syringe, tablets, capsule }

enum Specialisation {
  general,
  ortho,
  dentist,
  gastrologist,
  diabetes,
  cardiologist
}

enum LabTestType { general, cardio, neuro, gastro, lungs, blood }

class Medicine {
  String image;
  String name;
  double price;
  int quantity;
  bool isFavorite;
  String description;
  double score;
  MedicineType type;
  int voter;

  Medicine(this.image, this.name, this.price, this.quantity, this.isFavorite,
      this.description, this.score, this.type, this.voter);
}

class Doctor {
  String image;
  String name;
  double fees;
  bool isFavorite;
  String description;
  Specialisation type;

  Doctor(this.image, this.name, this.fees, this.isFavorite, this.description,
      this.type);
}

class LabTest {
  String image;
  String name;
  double fees;
  String description;
  LabTestType type;

  LabTest(this.image, this.name, this.fees, this.description, this.type);
}
