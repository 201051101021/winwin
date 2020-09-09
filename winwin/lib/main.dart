import 'package:flutter/material.dart';
import 'package:winwin/auth.dart';
import 'package:winwin/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'WINWIN',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white)
          ),
        ),
        home: new LoginPage(auth: new Auth())
        );
  }
}
