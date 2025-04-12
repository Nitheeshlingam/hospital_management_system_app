class AdminModel {
  int? adminid;
  String adminname;
  String loginid;
  String password;
  String status;
  String usertype;

  AdminModel({
    this.adminid,
    required this.adminname,
    required this.loginid,
    required this.password,
    required this.status,
    required this.usertype,
  });

  // Convert from JSON
  factory AdminModel.fromJSON(Map<String, dynamic> json) {
    return AdminModel(
      adminid: json['adminid'],
      adminname: json['adminname'],
      loginid: json['loginid'],
      password: json['password'],
      status: json['status'],
      usertype: json['usertype'],
    );
  }

  // Convert to JSOn
  Map<String, dynamic> toJSON() {
    return {
      'adminid': adminid,
      'adminname': adminname,
      'loginid': loginid,
      'password': password,
      'status': status,
      'usertype': usertype
    };
  }
}
