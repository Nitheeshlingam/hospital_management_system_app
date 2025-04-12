class OrdersModel {
  int? orderid;
  int patientid;
  int doctorid;
  int prescriptionid;
  String orderDate;
  String deliveryDate;
  String address;
  String mobileNo;
  String note;
  String status;
  String paymentType;
  String cardNo;
  String cvvNo;
  String expDate;
  String cardHolder;

  OrdersModel({
    this.orderid,
    required this.patientid,
    required this.doctorid,
    required this.prescriptionid,
    required this.orderDate,
    required this.deliveryDate,
    required this.address,
    required this.mobileNo,
    required this.note,
    required this.status,
    required this.paymentType,
    required this.cardNo,
    required this.cvvNo,
    required this.expDate,
    required this.cardHolder
  });

  // From JSON
  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      orderid: json['orderid'],
      patientid: json['patientid'],
      doctorid: json['doctorid'],
      prescriptionid: json['prescriptionid'],
      orderDate: json['orderdate'],
      deliveryDate: json['deliverydate'],
      address: json['address'],
      mobileNo: json['mobileno'],
      note: json['note'],
      status: json['status'],
      paymentType: json['payment_type'],
      cardNo: json['card_no'],
      cvvNo: json['cvv_no'],
      expDate: json['expdate'],
      cardHolder: json['card_holder'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'orderid': orderid,
      'patientid': patientid,
      'doctorid': doctorid,
      'prescriptionid': prescriptionid,
      'orderdate': orderDate,
      'deliverydate': deliveryDate,
      'address': address,
      'mobileno': mobileNo,
      'note': note,
      'status': status,
      'payment_type': paymentType,
      'card_no': cardNo,
      'cvv_no': cvvNo,
      'expdate': expDate,
      'card_holder': cardHolder,
    };
  }

}
