import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Login_btn extends StatelessWidget {
  Login_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.orange,
      splashColor: Colors.orangeAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class Createacc_btn extends StatelessWidget {
  Createacc_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Create an account",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class Phone_btn extends StatelessWidget {
  Phone_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.green[300],
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Login with phone number",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class Facebook_btn extends StatelessWidget {
  Facebook_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      splashColor: Colors.blueAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Login with Facebook",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class Google_btn extends StatelessWidget {
  Google_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.red,
      splashColor: Colors.redAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Login with Google",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class Guest_btn extends StatelessWidget {
  Guest_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.grey,
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Guest",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class Register_btn extends StatelessWidget {
  Register_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.orange,
      splashColor: Colors.orangeAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Create",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class ResendEmail_btn extends StatelessWidget {
  ResendEmail_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.orange,
      splashColor: Colors.orangeAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Resend Email",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}



class Signout_btn extends StatelessWidget {
  Signout_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.orange,
      splashColor: Colors.orangeAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Signout",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}


class Forgot_btn extends StatelessWidget {
  Forgot_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
    
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Forgot password",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class Submit_btn extends StatelessWidget {
  Submit_btn({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.orange,
      splashColor: Colors.orangeAccent,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            /*Icon(
              Icons.face,
              color: Colors.amber,
            ),*/
            Text(
              "Submit",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}






