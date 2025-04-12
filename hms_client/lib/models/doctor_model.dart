class DoctorModel {
  int? doctorid;
  String doctorname;
  String mobileno;
  int departmentid;
  String loginid;
  String password;
  String status;
  String education;
  double experience;
  double consultancycharge;

  DoctorModel({
    this.doctorid,
    required this.doctorname,
    required this.mobileno,
    required this.departmentid,
    required this.loginid,
    required this.password,
    required this.status,
    required this.education,
    required this.experience,
    required this.consultancycharge,
  });

  // Convert from JSON
  factory DoctorModel.fromJSON(Map<String, dynamic> json) {
    return DoctorModel(
      doctorid: json['doctorid'],
      doctorname: json['doctorname'],
      mobileno: json['mobileno'],
      departmentid: json['departmentid'],
      loginid: json['loginid'],
      password: json['password'],
      status: json['status'],
      education: json['education'],
      experience: double.parse(json['experience'].toString()),
      consultancycharge: double.parse(json['consultancycharge'].toString()),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'doctorid': doctorid,
      'doctorname': doctorname,
      'mobileno': mobileno,
      'departmentid': departmentid,
      'loginid': loginid,
      'password': password,
      'status': status,
      'education': education,
      'experience': experience,
      'consultancycharge': consultancycharge,
    };
  }
}
