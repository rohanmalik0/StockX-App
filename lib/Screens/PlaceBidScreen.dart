import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:stockx/Constants/shoes.dart';
import 'package:stockx/Screens/HomeScreen.dart';
import 'package:stockx/Screens/shoesScreen.dart';

import '../Constants/Colors.dart';

class PlaceBid extends StatefulWidget {
  const PlaceBid({super.key});

  @override
  State<PlaceBid> createState() => _PlaceBidState();
}

class _PlaceBidState extends State<PlaceBid> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bidController = TextEditingController();
  TextEditingController askController = TextEditingController();
  final databaseref =
      FirebaseDatabase.instance.ref(Shoes.shoeslist[shoeindex]['name']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            "assets/images/logostockx.png",
            height: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Place Bid Here",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Name: ",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 300,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(fontSize: 12)),
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontSize: 16, fontFamily: 'regular'),
                  textAlign: TextAlign.start,
                  onChanged: (value) => print(value),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Bid Price:",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 300,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      hintText: "Enter Your Bid",
                      hintStyle: TextStyle(fontSize: 12)),
                  controller: bidController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16, fontFamily: 'regular'),
                  textAlign: TextAlign.start,
                  onChanged: (value) => print(value),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Ask Price:",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 300,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 2, color: ColorsConstant.defaultGreen),
                      ),
                      hintText: "Enter Your Asks",
                      hintStyle: TextStyle(fontSize: 12)),
                  controller: askController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16, fontFamily: 'regular'),
                  textAlign: TextAlign.start,
                  onChanged: (value) => print(value),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
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
                      databaseref
                          .child(
                              DateTime.now().millisecondsSinceEpoch.toString())
                          .set({
                        'name': nameController.text.toString(),
                        'bid': bidController.text.toString(),
                        'ask': askController.text.toString(),
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoesScreen(shoeindex)));
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
