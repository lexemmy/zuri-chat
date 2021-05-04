import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/button.dart';

class WelcomeScreen extends StatefulWidget {

static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'hero',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 50.0,
                  ),
                ),
                AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Zuri Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 300),)
                    ],
                    totalRepeatCount: 1,
                  ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Button(
              'Login',
              Colors.lightBlueAccent,
              (){
                Navigator.pushNamed(context, LoginScreen.id);
              }),
              Button(
              'Register',
              Colors.blueAccent,
              (){
                Navigator.pushNamed(context, RegistrationScreen.id);
              }),
          ],
        ),
      ),
    );
  }
}


