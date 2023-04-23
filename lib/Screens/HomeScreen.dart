import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stockx/Screens/WelcomScreen.dart';
import 'package:stockx/Screens/shoesScreen.dart';

import '../Constants/Colors.dart';
import '../Constants/arrays.dart';

int shoeindex = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            "assets/images/logostockx.png",
            height: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 43,
                color: const Color(0xFFF3F2F2),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Scrollbar(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                            onPressed: () {},
                            child: Text(
                              Lists.menuname[index],
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ));
                      },
                      itemCount: Lists.menuname.length,
                    ),
                  ),
                )),
            Container(
              height: 250,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                        items: Lists.imageList
                            .map(
                              (item) => Image.asset(
                                item['image_path'],
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            )
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 1.5,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            })),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 220),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: Lists.imageList.asMap().entries.map((e) {
                        print(e);
                        print(e.key);
                        return GestureDetector(
                          onTap: () => carouselController.animateToPage(e.key),
                          child: Container(
                            width: currentIndex == e.key ? 17 : 7,
                            height: 7,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == e.key
                                    ? Colors.red
                                    : Colors.teal),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  Text(
                    "Recommended For You",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Icon(Icons.help_rounded),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                height: 170,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                shoeindex = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShoesScreen(shoeindex)));
                              },
                              child: Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.black87)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Image.asset(
                                          Lists.itemlist[index]["image_path"],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: Text(
                                        Lists.itemlist[index]["name"],
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'regular',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: Text(
                                        Lists.itemlist[index]["ask"],
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.black54,
                                            fontFamily: 'regular',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: Text(
                                        "\$${Lists.itemlist[index]["price"].toString()}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'regular',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 8, bottom: 8),
                                      width: 90,
                                      height: 14,
                                      color: Color.fromARGB(255, 209, 209, 209),
                                      child: Text(
                                          "Last Sale: \$${Lists.itemlist[index]["Lastsale"].toString()}"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: Lists.itemlist.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    "Popular Brands",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Icon(Icons.shopping_bag),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              height: 90,
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(right: 8),
                      width: 117,
                      height: 80,
                      child: Image.asset(Lists.brands[index]["image_path"]),
                    );
                  },
                  itemCount: Lists.brands.length,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          constraints: const BoxConstraints.expand(),
          child: Column(children: [
            Container(
              height: 500,
            ),
            ElevatedButton(
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
                  auth.signOut().then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  }).onError((error, stackTrace) {
                    if (kDebugMode) {
                      print(error.toString());
                    }
                  });
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "regular",
                      fontWeight: FontWeight.w700),
                ))
          ]),
        ),
      ),
    );
  }
}
