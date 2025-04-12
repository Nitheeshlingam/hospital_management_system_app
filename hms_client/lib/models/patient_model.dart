class PatientModel {
  int? patientid;
  String patientname;
  String admissionDate;
  String admissiontime;
  String address;
  String mobileno;
  String city;
  String pincode;
  String loginid;
  String password;
  String bloodgroup;
  String gender;
  String dob;
  String status;

  PatientModel({
    this.patientid,
    required this.patientname,
    required this.admissionDate,
    required this.admissiontime,
    required this.address,
    required this.mobileno,
    required this.city,
    required this.pincode,
    required this.loginid,
    required this.password,
    required this.bloodgroup,
    required this.gender,
    required this.dob,
    required this.status,
  });

  // Convert to JSON
  factory PatientModel.fromJSON(Map<String, dynamic> json) {
    return PatientModel(
      patientid: json['patientid'],
      patientname: json['patientname'],
      admissionDate: json['admissionDate'],
      admissiontime: json['admissiontime'],
      address: json['address'],
      mobileno: json['mobileno'],
      city: json['city'],
      pincode: json['pincode'],
      loginid: json['loginid'],
      password: json['password'],
      bloodgroup: json['bloodgroup'],
      gender: json['gender'],
      dob: json['dob'],
      status: json['status'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJSON() {
    return {
      'patientid': patientid,
      'patientname': patientname,
      'admissionDate': admissionDate,
      'admissiontime': admissiontime,
      'address': address,
      'mobileno': mobileno,
      'city': city,
      'pincode': pincode,
      'loginid': loginid,
      'password': password,
      'bloodgroup': bloodgroup,
      'gender': gender,
      'dob': dob,
      'status': status,
    };
  }
}
