import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../text_styles.dart';

class AuthPage extends StatefulWidget {

  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String phoneNumber = '';
  bool validated = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Enter your phone number',
                style: headline,
                textAlign: TextAlign.center,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Please confirm your country code and enter your phone number',
                style: regular,
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                phoneNumber = number.phoneNumber ?? '';
              },
              onInputValidated: (bool value) {
                validated = value;
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              autoValidateMode: AutovalidateMode.disabled,
              formatInput: true,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(32),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    side: const BorderSide(
                      color: Colors.teal,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                child: Text('Continue'),
              ),
              onPressed: () async {
                if(validated){
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+44 7123 123 456',
                    verificationCompleted: (PhoneAuthCredential credential) {

                    },
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {},
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}