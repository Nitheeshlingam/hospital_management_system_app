class PrescriptionRecordsModel {
  int? prescriptionRecordId;
  int prescriptionId;
  String medicineName;
  double cost;
  int unit;
  String dosage;
  String status;

  PrescriptionRecordsModel({
    this.prescriptionRecordId,
    required this.prescriptionId,
    required this.medicineName,
    required this.cost,
    required this.unit,
    required this.dosage,
    required this.status
  });

  // Convert From JSON
  factory PrescriptionRecordsModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionRecordsModel(
      prescriptionRecordId: json['prescription_record_id'],
      prescriptionId: json['prescription_id'],
      medicineName: json['medicine_name'],
      cost: double.parse(json['cost'].toString()),
      unit: json['unit'],
      dosage: json['dosage'],
      status: json['status'],
    );
  }

  // Convert To JSON
  Map<String, dynamic> toJson() {
    return {
      'prescription_record_id': prescriptionRecordId,
      'prescription_id': prescriptionId,
      'medicine_name': medicineName,
      'cost': cost,
      'unit': unit,
      'dosage': dosage,
      'status': status,
    };
  }

}
