// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';


class MyUser {
  String uid;
  MyUser({this.uid});
}

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Stream<MyUser> get user {
    return _auth.authStateChanges().map((User user)=>_userFromFirebase(user));
     }
}
