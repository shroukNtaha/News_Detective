import 'package:News_Detective/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserAuth _userFromFirebaseUser(User user) {
    return user != null ? UserAuth(uid: user.uid) : null;
  }

  Stream<UserAuth> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  /*Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }*/

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
}
