class DoctorTimingModel {
  int? doctorTimingsId;
  int doctorid;
  String startTime;
  String endTime;
  String availableDay;
  String status;

  DoctorTimingModel({
    this.doctorTimingsId,
    required this.doctorid,
    required this.startTime,
    required this.endTime,
    required this.availableDay,
    required this.status
  });

  // Convert From JSON
  factory DoctorTimingModel.fromJson(Map<String, dynamic> json) {
    return DoctorTimingModel(
      doctorTimingsId: json['doctor_timings_id'],
      doctorid: json['doctorid'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      availableDay: json['available_day'],
      status: json['status'],
    );
  }

  // Convert To JSON
  Map<String, dynamic> toJson() {
    return {
      'doctor_timings_id': doctorTimingsId,
      'doctorid': doctorid,
      'start_time': startTime,
      'end_time': endTime,
      'available_day': availableDay,
      'status': status,
    };
  }

}
