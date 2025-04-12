class TreatmentModel {
  int? treatmentid;
  String treatmenttype;
  double treatmentCost;
  String note;
  String status;

  TreatmentModel({
    this.treatmentid,
    required this.treatmenttype,
    required this.treatmentCost,
    required this.note,
    required this.status
  });

  // Convert from JSON
  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      treatmentid: json['treatmentid'],
      treatmenttype: json['treatmenttype'],
      treatmentCost: double.parse(json['treatment_cost'].toString()),
      note: json['note'],
      status: json['status'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'treatmentid': treatmentid,
      'treatmenttype': treatmenttype,
      'treatment_cost': treatmentCost,
      'note': note,
      'status': status,
    };
  }

}
