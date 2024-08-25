import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/components/roundedButton.dart';
import 'package:flashchat/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = '///';

  const RegistrationScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String password;
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
                  textAlign: TextAlign.center,
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
                  textAlign: TextAlign.center,
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
                Colors.blueAccent,
                'Register',
                () async {
                  setState(() {
                    spinnerActive = true;
                  });
                  try {
                    Navigator.popAndPushNamed(context, ChatScreen.id);
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                  setState(() {
                    spinnerActive = false;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
