class PaymentModel {
  int? paymentid;
  int patientid;
  int appointmentid;
  String paiddate;
  String paidtime;
  double paidamount;
  String status;
  String cardholder;
  int cardnumber;
  int cvvno;
  String expdate;

  PaymentModel({
    this.paymentid,
    required this.patientid,
    required this.appointmentid,
    required this.paiddate,
    required this.paidtime,
    required this.paidamount,
    required this.status,
    required this.cardholder,
    required this.cardnumber,
    required this.cvvno,
    required this.expdate,
  });

  // Convert from JSON
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      paymentid: json['paymentid'],
      patientid: json['patientid'],
      appointmentid: json['appointmentid'],
      paiddate: json['paiddate'],
      paidtime: json['paidtime'],
      paidamount: double.parse(json['paidamount'].toString()),
      status: json['status'],
      cardholder: json['cardholder'],
      cardnumber: int.parse(json['cardnumber'].toString()),
      cvvno: json['cvvno'],
      expdate: json['expdate'],
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'paymentid': paymentid,
      'patientid': patientid,
      'appointmentid': appointmentid,
      'paiddate': paiddate,
      'paidtime': paidtime,
      'paidamount': paidamount,
      'status': status,
      'cardholder': cardholder,
      'cardnumber': cardnumber,
      'cvvno': cvvno,
      'expdate': expdate,
    };
  }

}
