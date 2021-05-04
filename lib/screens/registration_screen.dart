import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class RegistrationScreen extends StatefulWidget {
  

  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  password = value;
                },
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Button(
                'Register',
                Colors.blueAccent,
                () async {
                  setState(() {
                    showSpinner = true;
                  });
                 try{
                   final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                   if(newUser != null){
                     Navigator.pushNamed(context, ChatScreen.id);
                   }

                   setState(() {
                    showSpinner = false;
                  });
                 } on FirebaseAuthException catch (e){
                   setState(() {
                    showSpinner = false;
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "",
                      desc: "",
                      buttons: [
                        DialogButton(
                          child: Text(
                            e.code,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                  });
                 }
                }),
            ],
          ),
        ),
      ),
    );
  }
}
