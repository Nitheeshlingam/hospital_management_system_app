class DepartmentModel {
  int? departmentid;
  String departmentname;
  String description;
  String status;

  DepartmentModel({
    this.departmentid,
    required this.departmentname,
    required this.description,
    required this.status
  });

  // Convert From JSON
  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      departmentid: json['departmentid'],
      departmentname: json['departmentname'],
      description: json['description'],
      status: json['status'],
    );
  }

  // Convert To JSON
  Map<String, dynamic> toJson() {
    return {
      'departmentid': departmentid,
      'departmentname': departmentname,
      'description': description,
      'status': status,
    };
  }

}
