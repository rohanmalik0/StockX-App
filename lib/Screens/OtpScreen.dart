import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:stockx/Screens/HomeScreen.dart';

import '../Constants/Colors.dart';
import 'PhoneLoginScreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool authbool = false;
  TextEditingController smsCodeController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsConstant.defaultGreen),
        borderRadius: BorderRadius.circular(6),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorsConstant.defaultGreen),
      borderRadius: BorderRadius.circular(12),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );
    String smsCode = "";

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Image.asset(
                  "assets/images/Shoeart4.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Pinput(
              controller: smsCodeController,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == smsCodeController.text ? null : 'Otp is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
              onChanged: (s) {
                smsCode = s;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: 280,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorsConstant.defaultGreen),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  print(smsCode);
                  log("log${smsCodeController.text}");
                  await verifyotp(smsCodeController.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  "Verify Otp",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "regular",
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: InkWell(
                onTap: () => resendOtp(),
                child: RichText(
                  text: TextSpan(
                      text: "Didn't recieve the code? ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6A6C7B),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'),
                      children: const <TextSpan>[
                        TextSpan(
                            text: "Request Again",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF061D28),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto'))
                      ]),
                ),
              ),
            ),
            Text(
              "Get Otp on you Phone Number...",
              style: TextStyle(
                  fontSize: 12, fontFamily: 'regular', color: Colors.black87),
            ),
            SizedBox(
              height: 35,
            )
          ],
        ),
      ),
    );
  }

  verifyotp(String controller) async {
    log("Sign in" + controller);
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: PhoneScreen.verify, smsCode: controller);
    signInWithPhoneAuthCredential(phoneAuthCredential);
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }), (Route<dynamic> route) => false);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  resendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: PhoneScreen.PhoneNumberresend.toString(),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("verificationCompleted");
      },
      verificationFailed: (FirebaseAuthException authException) {
        if (authException.code == 'invalid-phone-number') {
          print(authException.code);
          print(authException.message);
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (verificationId, resendToken) async {
        PhoneScreen.verify = verificationId;
        log(PhoneScreen.verify);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OtpScreen()));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        PhoneScreen.verify = verificationId;
      },
    );

    print(PhoneScreen.PhoneNumberresend);
    log(PhoneScreen.PhoneNumberresend);
  }
}
