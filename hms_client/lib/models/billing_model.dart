class BillingModel {
  int? billingid;
  int patientid;
  int appointmentid;
  String billingdate;
  String billingtime;
  double discount;
  double taxamount;
  String discountreason;
  String dischargeTime;
  String dischargeDate;

  BillingModel({
    this.billingid,
    required this.patientid,
    required this.appointmentid,
    required this.billingdate,
    required this.billingtime,
    required this.discount,
    required this.taxamount,
    required this.discountreason,
    required this.dischargeTime,
    required this.dischargeDate
  });

  // Convert from JSON
  factory BillingModel.fromJson(Map<String, dynamic> json) {
    return BillingModel(
      billingid: json['billingid'],
      patientid: json['patientid'],
      appointmentid: json['appointmentid'],
      billingdate: json['billingdate'],
      billingtime: json['billingtime'],
      discount: double.parse(json['discount'].toString()),
      taxamount: double.parse(json['taxamount'].toString()),
      discountreason: json['discountreason'],
      dischargeTime: json['discharge_time'],
      dischargeDate: json['discharge_date'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'billingid': billingid,
      'patientid': patientid,
      'appointmentid': appointmentid,
      'billingdate': billingdate,
      'billingtime': billingtime,
      'discount': discount,
      'taxamount': taxamount,
      'discountreason': discountreason,
      'discharge_time': dischargeTime,
      'discharge_date': dischargeDate,
    };
  }

}
