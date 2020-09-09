import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winwin/home.dart';
import 'auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:regexed_validator/regexed_validator.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register, guest, facebook, phone}

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
        } 
        else if (_formType == FormType.guest) {
          UserCredential result = await FirebaseAuth.instance
              .signInAnonymously();         
          User user = result.user;
          print('Signed in: ${user.uid}');
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        } 
        else if (_formType == FormType.phone) {
            
        }
        else if (_formType == FormType.facebook) {
            
        }
        else {
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

  void moveToGuest() {
    setState(() {
      _formType = FormType.guest;
    });
  }

  void moveToFacebook() {
    setState(() {
      _formType = FormType.facebook;
    });
  }

void moveToPhone() {
    setState(() {
      _formType = FormType.phone;
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
        !validator.email(value) ? 'Please provide a valid Email' : null, 
       // !EmailValidator.validate(value, true)
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        style: TextStyle(color: Colors.white,fontSize: 25.0),
        decoration: new InputDecoration(labelText: 'Password',hintText: "Enter your password",labelStyle: new TextStyle(color: Colors.white),hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey[200])),
        obscureText: true,
        validator: (value) => value.length < 8  ? 'Use 8 characters or more' : null, 
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

      Container(     
        child: Row(children: <Widget>[
          Expanded(child: Divider(color: Colors.green[800])),
          Padding(
              padding: EdgeInsets.all(6),
              child: Text("or",
                  style: TextStyle(color: Colors.black87))),
          Expanded(child: Divider(color: Colors.green[800])),
        ])), 


      new RaisedButton(
          textColor: Colors.white,
          color: Colors.orange,
          child: new Text('Guest',
              style: new TextStyle(fontSize: 25.0)),
          onPressed: moveToGuest,
        ),






        
      ];
    }
  }
}
