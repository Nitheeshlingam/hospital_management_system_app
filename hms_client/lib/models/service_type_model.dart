class ServiceTypeModel {
  int? serviceTypeId;
  String serviceType;
  double servicecharge;
  String description;
  String status;

  ServiceTypeModel({
    this.serviceTypeId,
    required this.serviceType,
    required this.servicecharge,
    required this.description,
    required this.status
  });

  // Convert From JSON
  factory ServiceTypeModel.fromJson(Map<String, dynamic> json) {
    return ServiceTypeModel(
      serviceTypeId: json['service_type_id'],
      serviceType: json['service_type'],
      servicecharge: double.parse(json['servicecharge'].toString()),
      description: json['description'],
      status: json['status'],
    );
  }

  // Convert To JSON
  Map<String, dynamic> toJson() {
    return {
      'service_type_id': serviceTypeId,
      'service_type': serviceType,
      'servicecharge': servicecharge,
      'description': description,
      'status': status,
    };
  }

}
