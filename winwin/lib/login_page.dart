import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winwin/home.dart';
import 'auth.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

 bool validatePassword(String value){
        String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regpassword = new RegExp(pattern);
        return regpassword.hasMatch(value);
  }

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regemail = new RegExp(pattern);
  return (!regemail.hasMatch(value)) ? false : true;
}



enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  
  String _email;
  String _password;
  FormType _formType = FormType.login;

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
        if (_formType == FormType.login) {
          UserCredential result = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);         
          User user = result.user;
          user.sendEmailVerification();
          print('Signed in: ${user.uid}');
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          UserCredential result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          User user = result.user;
          user.sendEmailVerification();
          print('Registered user: ${user.uid} ');
        }
      } catch (e) {
        print('Error $e');
      }
    }
  }

  void moveToRegister() {
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        ));
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        style: TextStyle(color: Colors.white,fontSize: 25.0,),
        decoration: new InputDecoration(labelText: 'Email',hintText: "Enter your email",labelStyle: new TextStyle(color: Colors.white),hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[200])),
        validator: (value) => 
        !EmailValidator.validate(value, true) ? 'Please provide a valid Email' : null, 
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        style: TextStyle(color: Colors.white,fontSize: 25.0),
        decoration: new InputDecoration(labelText: 'Password',hintText: "Enter your password",labelStyle: new TextStyle(color: Colors.white),hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[200])),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null, 
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          textColor: Colors.white,
          color: Colors.orange,
          child: new Text('Login', style: new TextStyle( fontSize: 25.0)),
          onPressed: validateAndSubmit,
        ),

  Container(     
        child: Row(children: <Widget>[
          Expanded(child: Divider(color: Colors.green[800])),
          Padding(
              padding: EdgeInsets.all(6),
              child: Text("Don’t have an account?",
                  style: TextStyle(color: Colors.black87))),
          Expanded(child: Divider(color: Colors.green[800])),
        ])),   
        new RaisedButton(
          textColor: Colors.white,
          color: Colors.orange,
          child: new Text('Create an account',
              style: new TextStyle(fontSize: 25.0)),
          onPressed: moveToRegister,
         ),
      ];
    } else {
      return [
        new RaisedButton(
          textColor: Colors.white,
          color: Colors.orange,
          child: new Text('Create',
              style: new TextStyle(fontSize: 25.0)),
          onPressed: validateAndSubmit,
        ),
        Container(     
        child: Row(children: <Widget>[
          Expanded(child: Divider(color: Colors.green[800])),
          Padding(
              padding: EdgeInsets.all(6),
              child: Text("have any account?",
                  style: TextStyle(color: Colors.black87))),
          Expanded(child: Divider(color: Colors.green[800])),
        ])),   
        new RaisedButton(
          textColor: Colors.white,
          color: Colors.orange,
          child: new Text('Sign in',
              style: new TextStyle(fontSize: 25.0)),
          onPressed: moveToLogin,




  
        ),
      ];
    }
  }
}
