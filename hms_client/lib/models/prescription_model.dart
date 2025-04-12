class PrescriptionModel {
  int? prescriptionid;
  int treatmentRecordsId;
  int doctorid;
  int patientid;
  String deliveryType;
  int deliveryId;
  DateTime prescriptiondate;
  String status;

  PrescriptionModel({
    this.prescriptionid,
    required this.treatmentRecordsId,
    required this.doctorid,
    required this.patientid,
    required this.deliveryType,
    required this.deliveryId,
    required this.prescriptiondate,
    required this.status,
  });

  // Convert From JSON
  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      prescriptionid: json['prescriptionid'],
      treatmentRecordsId: json['treatment_records_id'],
      doctorid: json['doctorid'],
      patientid: json['patientid'],
      deliveryType: json['delivery_type'],
      deliveryId: json['delivery_id'],
      prescriptiondate: DateTime.parse(json['prescriptiondate']),
      status: json['status'],
    );
  }

  // Convert To JSON
  Map<String, dynamic> toJson() {
    return {
      'prescriptionid': prescriptionid,
      'treatment_records_id': treatmentRecordsId,
      'doctorid': doctorid,
      'patientid': patientid,
      'delivery_type': deliveryType,
      'delivery_id': deliveryId,
      'prescriptiondate': prescriptiondate.toIso8601String().split('T').first,
      'status': status,
    };
  }
}
