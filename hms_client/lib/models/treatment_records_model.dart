class TreatmentRecordsModel {
  int? treatmentRecordsId;
  int treatmentid;
  int appointmentid;
  int patientid;
  int doctorid;
  String treatmentDescription;
  String uploads;
  String treatmentDate;
  String treatmentTime;
  String status;

  TreatmentRecordsModel({
    this.treatmentRecordsId,
    required this.treatmentid,
    required this.appointmentid,
    required this.patientid,
    required this.doctorid,
    required this.treatmentDescription,
    required this.uploads,
    required this.treatmentDate,
    required this.treatmentTime,
    required this.status
  });

  // Convert from JSON
  factory TreatmentRecordsModel.fromJson(Map<String, dynamic> json) {
    return TreatmentRecordsModel(
      treatmentRecordsId: json['treatment_records_id'],
      treatmentid: json['treatmentid'],
      appointmentid: json['appointmentid'],
      patientid: json['patientid'],
      doctorid: json['doctorid'],
      treatmentDescription: json['treatment_description'],
      uploads: json['uploads'],
      treatmentDate: json['treatment_date'],
      treatmentTime: json['treatment_time'],
      status: json['status'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'treatment_records_id': treatmentRecordsId,
      'treatmentid': treatmentid,
      'appointmentid': appointmentid,
      'patientid': patientid,
      'doctorid': doctorid,
      'treatment_description': treatmentDescription,
      'uploads': uploads,
      'treatment_date': treatmentDate,
      'treatment_time': treatmentTime,
      'status': status,
    };
  }

}
