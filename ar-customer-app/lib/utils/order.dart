class OrderData {
  final l1;
  final l2;
  final l3;
  final l4;
  final phone;
  final name;
  final address;
  final finalprice;
  final date;
  final status;
  final cusid;
  const OrderData({
    required this.l1,
    required this.l2,
    required this.l3,
    required this.l4,
    required this.phone,
    required this.name,
    required this.address,
    required this.finalprice,
    required this.date,
    required this.status,
    required this.cusid,
  });

  Map<String, dynamic> toJson() => {
        "l1price": l1,
        "l2price": l2,
        "l3price": l3,
        "l4price": l4,
        "name": name,
        "phone": phone,
        "address": address,
        "finalprice": finalprice,
        "date": date,
        "status": status,
        'cusid': cusid,
      };
}
