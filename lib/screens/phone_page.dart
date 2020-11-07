import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:winwin/screens/as.dart';
import 'package:winwin/screens/home_page.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:winwin/widget_btn/custom_btn.dart';
import 'package:winwin/widget_txt/txt.dart';

class PhonePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PhonePageState();
}

enum FormType { phone }

class _PhonePageState extends State<PhonePage> {
  final formKey = new GlobalKey<FormState>();
  String otp, verificationId;
  bool checkedValue = false;
  String initialCountry = 'TH';
  PhoneNumber number = PhoneNumber(isoCode: 'TH');
  String _number;
  final _phoneController = TextEditingController();

  FormType _formType = FormType.phone;
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

  Future phoneLogin(String _number, BuildContext context) async {
    _auth.verifyPhoneNumber(
      phoneNumber: _number,
      timeout: Duration(seconds: 15),
      verificationCompleted: (AuthCredential credential) async {
        print("SS");

        //This callback would gets called when verification is done auto maticlly
      },
      verificationFailed: (FirebaseAuthException exception) {
        if (exception.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print(exception);
        }
      },
      codeSent: (String verId, [int forceResendingToken]) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Enter pin number',
                  style: TextStyle(fontSize: 20.0),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      onChanged: (value) {
                        print(value);
                        otp = value;
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 45,
                        fieldWidth: 30,
                        inactiveColor: Colors.purple,
                        activeColor: Colors.orange,
                        selectedColor: Colors.brown,
                      ),
                      keyboardType: TextInputType.number,
                      onCompleted: (value) async {
                        User user = _auth.currentUser;
                        

                        // Sign the user in (or link) with the credential
                        if (user == null) {
                          PhoneAuthCredential authCredential =
                              PhoneAuthProvider.credential(
                                  verificationId: verId, smsCode: otp);
                      
                          await _auth.signInWithCredential(authCredential);
                        } else if (user != null && user.isAnonymous == true) {
                          signout();
                        }
                      },
                    ),
                  ],
                ),
              );
            });
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        print(verId);
        print("Timeout");
      },
    );
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.phone && checkedValue == true) {
          phoneLogin(_number, context);
        }
      } catch (e) {
        print('Error $e');
      }
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
      InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          backgroundColor: Colors.orange,
        ),
        ignoreBlank: false,
        hintText: 'xx-xxx-xxxx',
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: _phoneController,
        inputBorder: OutlineInputBorder(),
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    return [
      Submit_btn(
        onPressed: () {
          try {
            if (formKey.currentState.validate() == true) {
              String mobile = "+66" + _phoneController.text.trim();
              phoneLogin(mobile, context);
              print(mobile);
            }
          } catch (e) {
            print('Error $e');
          }
        },
      ),
      Credit_txt(),
      Signout_btn(onPressed: () {
        signout();
      }),
      Userchck_btn(onPressed: () {
        User user = _auth.currentUser;
        print(user);
      }),
      Number_txt(),
    ];
  }
}

void signout() async {
  await FirebaseAuth.instance.signOut();
}
