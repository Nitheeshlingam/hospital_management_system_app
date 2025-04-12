class RoomModel {
  int? roomid;
  String roomtype;
  int roomno;
  int noofbeds;
  double roomTariff;
  String status;

  RoomModel({
    this.roomid,
    required this.roomtype,
    required this.roomno,
    required this.noofbeds,
    required this.roomTariff,
    required this.status
  });

  // Convert From JSON
  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      roomid: json['roomid'],
      roomtype: json['roomtype'],
      roomno: json['roomno'],
      noofbeds: json['noofbeds'],
      roomTariff: double.parse(json['room_tariff'].toString()),
      status: json['status'],
    );
  }

  // Convert To JSON
  Map<String, dynamic> toJson() {
    return {
      'roomid': roomid,
      'roomtype': roomtype,
      'roomno': roomno,
      'noofbeds': noofbeds,
      'room_tariff': roomTariff,
      'status': status,
    };
  }

}
