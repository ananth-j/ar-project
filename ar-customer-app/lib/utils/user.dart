import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String phone;
  final String address;
  final String username;

  const User({
    required this.username,
    required this.uid,
    required this.email,
    required this.phone,
    required this.address,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      phone: snapshot['phone'],
      address: snapshot['address'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "phone": phone,
        "address": address,
        'jion_date': DateTime.now(),
        'status': 'Allowed',
      };
}
