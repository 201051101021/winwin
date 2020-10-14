import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winwin/screens/login_page.dart';

import 'package:regexed_validator/regexed_validator.dart';
import 'package:winwin/widget_btn/custom_btn.dart';
import 'package:winwin/widget_txt/txt.dart';

class ForgotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ForgotPageState();
}

enum FormType { forgot }

class _ForgotPageState extends State<ForgotPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;

  FormType _formType = FormType.forgot;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.forgot) {
          await _auth.sendPasswordResetEmail(email: _email);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } catch (e) {
        print('Error $e');
      }
    }
  }

  void moveToForgot() {
    setState(() {
      _formType = FormType.forgot;
    });
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
            body: new Container(
              padding: EdgeInsets.all(16.0),
              child: new Form(
                key: formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildInputs() + buildSubmitButtons(),
                ),
              ),
            )));
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
        ),
        decoration: new InputDecoration(
            hintText: "Enter your email",
            labelStyle: new TextStyle(color: Colors.white),
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[200])),
        validator: (value) =>
            !validator.email(value) ? 'Please provide a valid Email' : null,
        onSaved: (value) => _email = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    return [
      Submit_btn(
        onPressed: validateAndSubmit,
      ),
      Credit_txt(),
    ];
  }
}
