// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flashchat/constants.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/components/roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '//';

  const LoginScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool spinnerActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinnerActive,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      KinputDecoration.copyWith(hintText: 'Enter Your Email')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: KinputDecoration.copyWith(
                      hintText: 'Enter Your Password')),
              const SizedBox(
                height: 24.0,
              ),
              roundedButton(
                Colors.lightBlueAccent,
                'Log In',
                () async {
                  setState(() {
                    spinnerActive = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, ChatScreen.id);
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                  setState(() {
                    spinnerActive = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
