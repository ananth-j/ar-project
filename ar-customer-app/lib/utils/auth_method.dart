import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../mongo_db.dart';
import 'user.dart' as moudles;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<moudles.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    //this user given by Firebase auth
    DocumentSnapshot documentSnapshot = await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .get(); // get uid and conveting DocmentSnapshot storing in snap

    return moudles.User.fromSnap(documentSnapshot);
  }

  Future<String> singUpUser({
    required String email,
    required String password,
    required String username,
    required String phone,
    required String address,
  }) async {
    String res = "Some error Occurred";
    try {
      // checking all text feild are fillded
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phone.isNotEmpty ||
          address.isNotEmpty) {
        // sing in with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // print(cred.user!.uid);
        // store data in firebase store
        moudles.User user = moudles.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          phone: phone,
          address: address,
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        Connector.storeCustomerDetails(user.toJson());
        return res = 'success';
      }
    } on FirebaseAuthException catch (e) {
      print(e.code.toString());
      switch (e.code) {
        case == 'email-already-in-use':
          res = 'This email is already registerd';
          break;
        case == 'invalid-email':
          res = 'Invalid email format ';
          break;
        case == 'wrong-password':
          res = 'Wrong password';
          break;
        case == 'weak-password':
          res = 'Password must be atleast 6 letters';
          break;
        default:
          res = 'Please enter all details ';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error accurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please Enter your email and password';
      }
    }
    // this for exeption coughter to user

    on FirebaseAuthException catch (e) {
      switch (e.code) {
        case == 'invalid-email':
          res = 'Invalid email format ';
          break;
        case == 'wrong-password':
          res = 'Wrong password';
          break;
        default:
          res = 'Please enter your email and password';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
