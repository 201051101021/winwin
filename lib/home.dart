import 'package:flutter/material.dart';
import 'auth.dart';

class Home extends StatelessWidget {
  Home({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signedOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('eeeee'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('log out',style: TextStyle(fontSize: 17,color: Colors.white)),
            onPressed: _signedOut
            )
        ],
      ),
      body: new Container(
        child: new Center(
          child:  new Text('wel',style: TextStyle(fontSize: 32)),
        ),
      ),
    );
  }
}
