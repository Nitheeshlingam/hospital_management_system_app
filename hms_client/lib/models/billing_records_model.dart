class BillingRecordsModel {
  int? billingserviceId;
  int billingid;
  int billTypeId;
  String billType;
  double billAmount;
  String billDate;
  String status;

  BillingRecordsModel({
    this.billingserviceId,
    required this.billingid,
    required this.billTypeId,
    required this.billType,
    required this.billAmount,
    required this.billDate,
    required this.status
  });

  // Convert from JSON
  factory BillingRecordsModel.fromJson(Map<String, dynamic> json) {
    return BillingRecordsModel(
      billingserviceId: json['billingservice_id'],
      billingid: json['billingid'],
      billTypeId: json['bill_type_id'],
      billType: json['bill_type'],
      billAmount: double.parse(json['bill_amount'].toString()),
      billDate: json['bill_date'],
      status: json['status'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'billingservice_id': billingserviceId,
      'billingid': billingid,
      'bill_type_id': billTypeId,
      'bill_type': billType,
      'bill_amount': billAmount,
      'bill_date': billDate,
      'status': status,
    };
  }

}
