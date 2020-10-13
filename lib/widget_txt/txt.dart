import 'package:flutter/material.dart';

class Credit_txt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 25),

        //margin: EdgeInsets.only(top:25),
        child: Row(children: <Widget>[
          Expanded(child: Divider(color: Colors.green[800])),
          Padding(
              padding: EdgeInsets.all(6),
              child: Text("POWER BY WINWIN",
                  style: TextStyle(fontSize: 17, color: Colors.black87))),
          Expanded(child: Divider(color: Colors.green[800])),
        ]));
  }
}

class Validate_txt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 25),

        //margin: EdgeInsets.only(top:25),
        child: Row(children: <Widget>[
          Expanded(child: Divider(color: Colors.green[800])),
          Padding(
              padding: EdgeInsets.all(6),
              child: Text("Please Verify Email",
                  style: TextStyle(fontSize: 25, color: Colors.black87))),
          Expanded(child: Divider(color: Colors.green[800])),
        ]));
  }
}
