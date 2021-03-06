import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winwin/screens/home_page.dart';

import 'package:winwin/widget_btn/custom_btn.dart';
import 'package:winwin/widget_txt/txt.dart';

class ValidatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ValidatePageState();
}

class _ValidatePageState extends State<ValidatePage> {
  Future<Null> refresher() {
    User user = FirebaseAuth.instance.currentUser;

    if (user.emailVerified == true)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.white)),
        ),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.orange[300],
          appBar: new AppBar(
            title: new Text('WINWIN APP'),
          ),
          body: new RefreshIndicator(
            onRefresh: refresher,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: buildtext() + buildSubmitButtons(),
            ),
          ),
        ));
  }
}

void resend() async {
  final User user = FirebaseAuth.instance.currentUser;
  await user.sendEmailVerification();
}

void signout() async {
  await FirebaseAuth.instance.signOut();
}

List<Widget> buildtext() {
  return [
    Validate_txt(),
  ];
}

List<Widget> buildSubmitButtons() {
  return [
    ResendEmail_btn(
      onPressed: resend,
    ),
    Signout_btn(
      onPressed: signout,
    ),
   /* Signout_btn(
      onPressed: () {
        User user = FirebaseAuth.instance.currentUser;
        print(user);
      },
    ),*/
    Credit_txt(),
  ];
}
