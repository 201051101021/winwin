import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winwin/screens/profile_page.dart';
import 'package:winwin/screens/test.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage({this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.white)),
        ),
        home: Scaffold(
          appBar: new AppBar(
            title: new Text('WINWIN APP'),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(child: Text('${user.uid} (Pic)')),
                ListTile(
                  
                  title: Text("Profile (btn)"),
                  
                  onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        }
                ),
                ListTile(
                  title: Text("setting (btn)"),
                  onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirebaseDemoScreen()));
                    
                  },
                ),
                ListTile(
                  title: Text("logs (btn)"),
                ),
                ListTile(
                  title: Text("log out (btn)"),
                ),
                ListTile(
                  title: Text("User Id (text)"),
                ),
                ListTile(
                  title: Text("Logout (text,ico)"),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ),
          body: new Container(
            child: new Center(
              child: new Text('Map', style: TextStyle(fontSize: 90)),
            ),
          ),
        ));
  }
}
