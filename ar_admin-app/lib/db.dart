import 'package:mongo_dart/mongo_dart.dart';

const ConnectorURL =
    'MONGO_DB_URL';

class Connector {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(ConnectorURL);
    await db.open();
    print(db);
  }
  //<uses-permission android:name="android.permission.INTERNET" />

  static Future<List<Map<String, dynamic>>> getDeliverdOrders() async {
    var data;
    try {
      userCollection = db.collection('orders');
      data = await userCollection
          .find(
              where.eq('status', 'Delivered').sortBy('date', descending: true))
          .toList();
    } catch (e) {}

    return data;
  }

  static Future<List<Map<String, dynamic>>> getPendingOrders() async {
    var data;
    try {
      userCollection = db.collection('orders');
      data = await userCollection
          .find(where.eq('status', 'Accepted').sortBy('date', descending: true))
          .toList();
    } catch (e) {}

    return data;
  }

  static Future<List<Map<String, dynamic>>> getCanceldOrders() async {
    var data;

    try {
      userCollection = db.collection('orders');
      data = await userCollection
          .find(
              where.eq('status', 'Cancelled').sortBy('date', descending: true))
          .toList();
    } catch (e) {}

    return data;
  }

  static Future<List<Map<String, dynamic>>> getRejectedOrders() async {
    var data;
    try {
      userCollection = db.collection('orders');
      data = await userCollection
          .find(where.eq('status', 'Rejected').sortBy('date', descending: true))
          .toList();
    } catch (e) {}

    return data;
  }

  static deleteCustomerOrderHistory(id) async {
    try {
      userCollection = db.collection('orders');
      await userCollection.remove(where.eq('cusid', id));
    } catch (e) {}
  }

  static Future<List<Map<String, dynamic>>> getNewOrders() async {
    var data;

    try {
      userCollection = db.collection('orders');
      data = await userCollection
          .find(where.eq('status', 'Pending').sortBy('date', descending: true))
          .toList();
    } catch (e) {}

    return data;
  }

  static Future<List<Map<String, dynamic>>> getCustomersOrderHistory(id) async {
    var data;

    //   try {
    userCollection = db.collection('orders');
    data = await userCollection
        .find(where.eq('cusid', '$id').sortBy('date', descending: true))
        .toList();
    // } catch (e) {}

    return data;
  }

  static getCustomers() async {
    var data;

    try {
      userCollection = db.collection('customers');
      data = await userCollection
          .find(where.limit(1000).sortBy('jion_date', descending: true))
          .toList();
    } catch (e) {}

    return data;
  }

  static acceptOrder(id, data) async {
    try {
      userCollection = db.collection('orders');
      final query = where.eq('_id', id);
      final update = modify
          .set('status', 'Accepted')
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

  static bolckCustomer(id, data) async {
    try {
      userCollection = db.collection('customers');
      final query = where.eq('_id', id);
      final update = modify
          .set('status', 'Blocked')
          .set('username', data['username'])
          .set('phone', data['phone'])
          .set('address', data['address'])
          .set('uid', data['uid'])
          .set('email', data['email'])
          .set('jion_date', data['jion_date']);
      await userCollection.update(query, update);
    } catch (e) {}
  }

  static unBlockCustomer(id, data) async {
    try {
      userCollection = db.collection('customers');
      final query = where.eq('_id', id);
      final update = modify
          .set('status', 'Allowed')
          .set('username', data['username'])
          .set('phone', data['phone'])
          .set('address', data['address'])
          .set('uid', data['uid'])
          .set('email', data['email'])
          .set('jion_date', data['jion_date']);
      await userCollection.update(query, update);
    } catch (e) {}
  }

  static rejectOrder(id, data) async {
    try {
      userCollection = db.collection('orders');
      final query = where.eq('_id', id);
      final update = modify
          .set('status', 'Rejected')
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

  static putPending(id, data) async {
    try {
      userCollection = db.collection('orders');
      final query = where.eq('_id', id);
      final update = modify
          .set('status', 'Pending')
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

  static deliverdOrder(id, data) async {
    try {
      userCollection = db.collection('orders');
      final query = where.eq('_id', id);
      final update = modify
          .set('status', 'Delivered')
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
}
