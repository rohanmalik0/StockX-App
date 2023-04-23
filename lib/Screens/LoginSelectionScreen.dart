import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stockx/Screens/HomeScreen.dart';
import 'package:stockx/Screens/PhoneLoginScreen.dart';

import '../Constants/Colors.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Image.asset(
                "assets/images/Shoeart2.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhoneScreen(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_android),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Continue With Number",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "regular",
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    color: Color.fromARGB(255, 99, 98, 98),
                    width: 70,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Or Login With"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 1,
                    color: Color.fromARGB(255, 99, 98, 98),
                    width: 70,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 280,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.black45),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await SignInWithGoogle();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/Google.png"),
                            height: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Google",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "regular",
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            
          ],
        ),
      ),
    );
  }

  SignInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
  }
}
