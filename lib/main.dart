import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winwin/screens/home_page.dart';
import 'package:winwin/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:winwin/screens/validate_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Land(),
    );
  }
}

class Land extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error:${snapshot.error}"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  if (user == null) {
                    return LoginPage();
                  }

                  if (user != null && user.emailVerified == true ) {
                    return HomePage();
                  }
                  if (user.emailVerified != true) {
                    return ValidatePage();
                  }
                }
                return Scaffold(
                  body: Center(
                    child: Text("wait"),
                  ),
                );
              });
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: Text("Checking Authentication....."),
          ),
        );
      },
    );
  }
}
