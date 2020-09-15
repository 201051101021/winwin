/*import 'package:flutter/material.dart';
import 'package:winwin/home.dart';
import 'login_page.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus { notSignedIn, SignedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  User _user;

  initState() {
    super.initState();
    widget.auth.currentUser(_user).then((user){
      setState(() {
        authStatus = _user == null ? AuthStatus.notSignedIn : AuthStatus.SignedIn;
      });
    });
  }
  /*FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        _signedOut();
      } else {
        _signedIn();
      }
    });
  }*/

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.SignedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.SignedIn:
        return new Home(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
  }
}
*/