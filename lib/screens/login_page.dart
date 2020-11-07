import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winwin/screens/forgot_page.dart';

import 'package:winwin/screens/phone_page.dart';
import 'package:winwin/screens/register_page.dart';
import 'package:regexed_validator/regexed_validator.dart';

import 'package:winwin/widget_btn/custom_btn.dart';
import 'package:winwin/widget_txt/txt.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register, guest, facebook, phone, google, forgot }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType;
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

  void emailLogin() async {
    setState(() {
      _formType = FormType.login;
    });
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          signOut();

          UserCredential result = await _auth
              .signInWithEmailAndPassword(email: _email, password: _password);
          User user = result.user;

          print('Signed in: ${user.uid}');
        }
      } catch (e) {
        print('Error $e');
      }
    }
  }

  void guestLogin() async {
    setState(() {
      _formType = FormType.guest;
    });
    try {
      if (_formType == FormType.guest) {
        signOut();
        UserCredential result = await _auth.signInAnonymously();
        User user = result.user;
        print('Signed in: ${user.uid}');
      
  
      }
    } catch (e) {
      print('Error $e');
    }
  }

  void register() async {
    setState(() {
      _formType = FormType.register;
    });
    try {
      if (_formType == FormType.register) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      }
      formKey.currentState.reset();
    } catch (e) {
      print('Error $e');
    }
  }

  void signOut() async {
    return await _auth.signOut();
  }

  void forgot() async {
    setState(() {
      _formType = FormType.forgot;
    });
    try {
      if (_formType == FormType.forgot) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgotPage()));
      }
      formKey.currentState.reset();
    } catch (e) {
      print('Error $e');
    }
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
      Login_btn(
        onPressed: emailLogin,
      ),
      Or_txt(),
      Guest_btn(
        onPressed: guestLogin,
      ),
      Phone_btn(onPressed: () {
        // final User user = FirebaseAuth.instance.currentUser;

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PhonePage()));
        formKey.currentState.reset();
      }),
      Anyacc_txt(),
      Createacc_btn(
        onPressed: register,
      ),

      
     /* Facebook_btn(
        onPressed: guestLogin,
      ),
      Google_btn(
        onPressed: guestLogin,
      ),
*/
      Forgot_btn(
        onPressed: forgot,
      ),
    ];
  }
}
