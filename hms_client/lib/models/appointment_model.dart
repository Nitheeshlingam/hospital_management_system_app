class AppointmentModel {
  int? appointmentid;
  String appointmenttype;
  int patientid;
  int roomid;
  int departmentid;
  String appointmentdate;
  String appointmenttime;
  int doctorid;
  String status;
  String appReason;

  AppointmentModel({
    this.appointmentid,
    required this.appointmenttype,
    required this.patientid,
    required this.roomid,
    required this.departmentid,
    required this.appointmentdate,
    required this.appointmenttime,
    required this.doctorid,
    required this.status,
    required this.appReason,
  });

  // Convert from JSON
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentid: json['appointmentid'],
      appointmenttype: json['appointmenttype'],
      patientid: json['patientid'],
      roomid: json['roomid'],
      departmentid: json['departmentid'],
      appointmentdate: json['appointmentdate'],
      appointmenttime: json['appointmenttime'],
      doctorid: json['doctorid'],
      status: json['status'],
      appReason: json['app_reason'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'appointmentid': appointmentid,
      'appointmenttype': appointmenttype,
      'patientid': patientid,
      'roomid': roomid,
      'departmentid': departmentid,
      'appointmentdate': appointmentdate,
      'appointmenttime': appointmenttime,
      'doctorid': doctorid,
      'status': status,
      'app_reason': appReason,
    };
  }
}
