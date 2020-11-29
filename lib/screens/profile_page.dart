import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

// class ProfilePage extends StatelessWidget {
//   final User user;
//   ProfilePage({this.user});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primarySwatch: Colors.orange,
//           primaryTextTheme:
//               TextTheme(headline6: TextStyle(color: Colors.white)),
//         ),
//         home: Scaffold(
//           appBar: new AppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             title: new Text('WINWIN APP'),
//           ),
//           body: new Container(
//             child: new Center(
//               child: new Text('User uid : ${user.uid}      User email : ${user.email},    User Phone : ${user.phoneNumber}',
//                   style: TextStyle(fontSize: 40)),
//             ),
//           ),
//         ));
//   }

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();

    Future getImage() async {
      var image = await _picker.getImage(source: ImageSource.gallery);
      final File file = File(image.path);
      setState(() {
        _image = file;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      Reference firebaseStorageRef = _storage.ref().child(fileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(_image);

      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.white)),
        ),
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(FontAwesomeIcons.arrowLeft),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text('Edit Profile'),
          ),
          body: Builder(
            builder: (context) => Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.orangeAccent,
                          child: ClipOval(
                            child: new SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image != null)
                                  ? Image.file(
                                      _image,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 30.0,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Username',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('TEST',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Birthday',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('1st April, 2000',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Location',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Paris, France',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Email',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('${user.email} ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Phone',
                                    style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 18.0)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('${user.phoneNumber}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.pen,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      /* RaisedButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    elevation: 4.0,
                    splashColor: Colors.orangeAccent,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),*/
                      RaisedButton(
                        color: Colors.orangeAccent,
                        onPressed: () {
                          uploadPic(context);
                        },
                        elevation: 4.0,
                        splashColor: Colors.orangeAccent,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
