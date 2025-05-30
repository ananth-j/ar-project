import 'package:mongo_dart/mongo_dart.dart';

const ConnectorURL =
    'MONGO_DB_URL';

class Connector {
  State state = State.init;

  static var db, userCollection;
  static connect() async {
    try {
      db = await Db.create(ConnectorURL);
      await db.open();
    } catch (e) {}
  }

  static orderHistory(data) async {
    try {
      userCollection = db.collection('orders');
      await userCollection.insertOne(data);
    } catch (e) {}
  }

//Future<List<Map<String, dynamic>>>
  static getOrderHistory(cusid) async {
    try {
      var data;
      userCollection = db.collection('orders');
      data = await userCollection
          .find(where.eq('cusid', cusid).sortBy('date', descending: true))
          .toList();
      return data;
    } catch (e) {}
  }

  static getCustomer(uid) async {
    try {
      var data;
      userCollection = db.collection('customers');
      data = await userCollection.find(where.eq('uid', uid)).toList();
      return data;
    } catch (e) {}
  }

  static cancelOrder(id, data) async {
    try {
      userCollection = db.collection('orders');
      final query = where.eq('_id', id);
      final update = modify
          .set('status', 'Cancelled')
          .set('l1price', data['l1price'])
          .set('l2price', data['l2price'])
          .set('l3price', data['l3price'])
          .set('l4price', data['l4price'])
          .set('name', data['name'])
          .set('phone', data['phone'])
          .set('address', data['address'])
          .set('finalprice', data['finalprice'])
          .set('date', data['date'])
          .set('cusid', data['cusid']);
      await userCollection.update(query, update);
    } catch (e) {}
  }

  static editUserData(data, uid) async {
    userCollection = db.collection('orders');
    final query = where.eq('uid', uid);
  }

  static storeCustomerDetails(data) async {
    try {
      userCollection = db.collection('customers');
      await userCollection.insertOne(data);
    } catch (e) {}
  }
}
