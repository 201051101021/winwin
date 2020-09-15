import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  /*Future<String> currentUser(User user);*/
}

class Auth implements BaseAuth {
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return user.uid;
  }

 /*Future<String> currentUser(User user) async {
    FirebaseAuth.instance.authStateChanges().listen((User user) {});
    return user.uid;
  }*/

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  /*Future<User> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential();

    UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    User user = result.user;
    return user;
  }*/
}
