import 'package:news_detective/models/authorization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Authorization _userFromFirebaseUser(User user) {
    return user != null ? Authorization(uid: user.uid) : null;
  }

  Stream<Authorization> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      print("registiration with email= $email and password= $password");

      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(result);
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getCurrentUser() async {
    User user = _auth.currentUser;
    String uid = user.uid.toString();
    return uid;
  }
}
