class MedicineModel {
  int? medicineid;
  String medicinename;
  double medicinecost;
  String description;
  String status;

  MedicineModel({
    this.medicineid,
    required this.medicinename,
    required this.medicinecost,
    required this.description,
    required this.status
  });

  // Convert From JSON
  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      medicineid: json['medicineid'],
      medicinename: json['medicinename'],
      medicinecost: (json['medicinecost'] as num).toDouble(),
      description: json['description'],
      status: json['status'],
    );
  }

  // Convert To JSON
  Map<String, dynamic> toJson() {
    return {
      'medicineid': medicineid,
      'medicinename': medicinename,
      'medicinecost': medicinecost,
      'description': description,
      'status': status,
    };
  }

}
