import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winwin/screens/login_page.dart';

import 'package:winwin/widget_btn/custom_btn.dart';
import 'package:winwin/widget_txt/txt.dart';

class PhonePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PhonePageState();
}

enum FormType { phone }

class _PhonePageState extends State<PhonePage> {
  final formKey = new GlobalKey<FormState>();
  

  bool checkedValue = false;

  String _number;
  String _password;
  FormType _formType = FormType.phone;
    final FirebaseAuth _auth = FirebaseAuth.instance;


  bool isValidPhoneNumber(String phoneNumber) {
  // You may need to change this pattern to fit your requirement.
  // I just copied the pattern from here: https://regexr.com/3c53v
  final pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
  final regExp = RegExp(pattern);

  if (phoneNumber == null || phoneNumber.isEmpty ) {
    return false;
  }

  if (!regExp.hasMatch(phoneNumber)) {
    return false;
  }
  return true;
}


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
        if (_formType == FormType.phone && checkedValue == true) {
          UserCredential result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _number, password: _password);
          User user = result.user;

          await _auth.verifyPhoneNumber(
    phoneNumber: _number,
    timeout: Duration(seconds: 60),
    verificationCompleted: null,
    verificationFailed: null,
    codeSent: null,
    codeAutoRetrievalTimeout: null
  );



          print('Registered user: ${user.uid} ');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } catch (e) {
        print('Error $e');
      }
    }
  }

  void moveToCreate() {
    setState(() {
      _formType = FormType.phone;
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
                  children: buildInputs() + check() + buildSubmitButtons(),
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
            hintText: "Enter your Phone number",
            labelStyle: new TextStyle(color: Colors.white),
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[200])),
        validator:  (value) =>
            value.length > 11 || !isValidPhoneNumber(value) ? 'Please provide a valid Phone number' : null,
        onSaved: (value) => _number = value,
      ),
      new TextFormField(
        style: TextStyle(color: Colors.white, fontSize: 25.0),
        decoration: new InputDecoration(
            hintText: "Enter your password",
            labelStyle: new TextStyle(color: Colors.white),
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[200])),
        obscureText: true,
        validator: (value) =>
            value.length < 8 ? 'Use 8 characters or more' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    return [
      Register_btn(
        onPressed: validateAndSubmit,
      ),
      Credit_txt(),
    ];
  }

  List<Widget> check() {
    return [
      LinkedLabelCheckbox(
  
        label: 'Privacy & Policy',
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
        
        value: checkedValue,
        onChanged: (bool newValue) {
          setState(() {
            checkedValue = newValue;
          });
        },
        
      )
    ];
  }
}

class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                text: label,
                style: TextStyle(
                  color: Colors.redAccent,
                  decoration: TextDecoration.underline,
                  fontSize: 20
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Label has been tapped.');
                  },
              ),
            ),
          ),
          Checkbox(
            value: value,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}