import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:stockx/Constants/Colors.dart';
import 'package:stockx/Screens/LoginSelectionScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                "assets/images/Shoesart.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Upgrade your looks with \nStockX",
                style: TextStyle(
                  fontFamily: "regular",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Buy the future trends and fashion for enhancing your looks and personality",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 35,
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
                        builder: (context) => LoginSelectionScreen(),
                      ));
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "regular",
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
