import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stockx/Screens/OtpScreen.dart';

import '../Constants/Colors.dart';
import 'LoginSelectionScreen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});
  static String verify = "";
  static String PhoneNumberresend = "";
  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  String CountryCodeSelected = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    TextEditingController? PhoneNumberController = TextEditingController();
    String PhoneNumber = '';
    String phonNumberComp = '';

    return MaterialApp(
      supportedLocales: [
        Locale("en"),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Image.asset(
                    "assets/images/Shoeart3.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 327,
                height: 52,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Flexible(
                        child: CountryCodePicker(
                          flagWidth: 32,
                          onChanged: _onCountryChange,
                          initialSelection: 'US',
                          favorite: ['+91', 'IN'],
                          showCountryOnly: false,
                          textStyle: TextStyle(fontSize: 16),
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                      Text(
                        "-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        width: 182,
                        height: 48,
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: ColorsConstant.defaultGreen),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: ColorsConstant.defaultGreen),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: ColorsConstant.defaultGreen),
                              ),
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyle(fontSize: 12)),
                          controller: PhoneNumberController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(fontSize: 16, fontFamily: 'regular'),
                          textAlign: TextAlign.start,
                          onChanged: (value) => print(value),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    PhoneNumber = PhoneNumberController.text;
                    PhoneNumber = PhoneNumberController.text;
                    phonNumberComp = CountryCodeSelected + PhoneNumber;
                    PhoneScreen.PhoneNumberresend = phonNumberComp;
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phonNumberComp.toString(),
                      timeout: const Duration(seconds: 60),
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        print("verificationCompleted");
                      },
                      verificationFailed:
                          (FirebaseAuthException authException) {
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
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen()));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        PhoneScreen.verify = verificationId;
                      },
                    );

                    print(phonNumberComp);
                    log(phonNumberComp);

                    print(PhoneNumberController.text);
                  },
                  child: Text(
                    "Get Otp",
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
      ),
    );
  }

  void _onCountryChange(CountryCode countryCode) {
    CountryCodeSelected = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }
}
