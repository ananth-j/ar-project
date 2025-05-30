import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expriment/mongo_db.dart';
import 'package:uuid/uuid.dart';

import 'order.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> upData({
    required l1,
    required l2,
    required l3,
    required l4,
    required String name,
    required String phone,
    required String address,
    required String uid,
    required finalprice,
    required date,
    required status,
    required cusid,
  }) async {
    var res = 'Something wrong';
    var checkData;
    try {
      OrderData orderData = OrderData(
        l1: l1,
        l2: l2,
        l3: l3,
        l4: l4,
        phone: phone,
        name: name,
        address: address,
        finalprice: finalprice,
        date: date,
        status: status,
        cusid: cusid,
      );
      checkData = await Connector.getCustomer(cusid);
      if (checkData[0]['status'] == 'Allowed') {
        await Connector.orderHistory(orderData.toJson());
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
