import 'package:flutter/material.dart';
import 'package:stockx/Screens/HomeScreen.dart';
import 'package:stockx/Screens/PlaceBidScreen.dart';
import 'package:stockx/Screens/ViewAsk.dart';
import 'package:stockx/Screens/ViewBidScreen.dart';

import '../Constants/arrays.dart';
import '../Constants/shoes.dart';

class ShoesScreen extends StatefulWidget {
  const ShoesScreen(int shoeindex, {super.key});

  @override
  State<ShoesScreen> createState() => _ShoesScreenState();
}

class _ShoesScreenState extends State<ShoesScreen> {
  int indexcurrent = shoeindex;
  bool fav = false;
  bool growth = Shoes.shoeslist[shoeindex]["bool"];
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black45),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PlaceBid()));
                    },
                    child: Text(
                      "Place Bid/Asks",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black45),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Buy for \$${Shoes.shoeslist[shoeindex]["price"]}",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Text(
              "${Shoes.shoeslist[shoeindex]["name"]}",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "${Shoes.shoeslist[shoeindex]["color"]}",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w500,
                  color: Colors.black45),
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          fav = !fav;
                        });
                      },
                      icon: Icon(
                        fav ? Icons.favorite : Icons.favorite_border,
                      )),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                Shoes.shoeslist[shoeindex]["image_path"],
                scale: 0.5,
              ),
            ),
            Text(
              "Last Sale: ",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'regular',
                  color: Color.fromARGB(255, 26, 25, 25)),
            ),
            Text(
              "\$${Shoes.shoeslist[shoeindex]["price"]}",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w700),
            ),
            Container(
              height: 27,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(growth ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      size: 30, color: growth ? Colors.green : Colors.red),
                  Text(
                    "${Shoes.shoeslist[shoeindex]["growth"]}",
                    style: TextStyle(
                        color: growth ? Colors.green : Colors.red,
                        fontSize: 11,
                        fontFamily: 'regular'),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black45),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewAsk()));
                    },
                    child: Text(
                      "View Asks",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black45),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewBid()));
                    },
                    child: Text(
                      "View Bid",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.black45),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "View Sale",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: Colors.black45),
                      bottom: BorderSide(width: 0.5, color: Colors.black45))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.verified_outlined),
                      Text(
                        "StockX Verified",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Condition: ",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        "New",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w100,
                            color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: Colors.black45),
                      bottom: BorderSide(width: 0.5, color: Colors.black45))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.shield_outlined),
                      Text(
                        "Our Promise",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(Icons.arrow_drop_down_outlined))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Related Products",
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
            SizedBox(
              height: 16,
            ),
            Container(
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
                                    margin: EdgeInsets.only(left: 8, bottom: 8),
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
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Product Details",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w700),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Style',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'regular',
                      ),
                    ),
                    Text(
                      '${Shoes.shoeslist[shoeindex]['style']}',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'regular',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Colorway',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'regular',
                      ),
                    ),
                    Text(
                      '${Shoes.shoeslist[shoeindex]['Colorway']}',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'regular',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Retail Price',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'regular',
                      ),
                    ),
                    Text(
                      '${Shoes.shoeslist[shoeindex]['retail']}',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'regular',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Release Date',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'regular',
                      ),
                    ),
                    Text(
                      '${Shoes.shoeslist[shoeindex]['release']}',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'regular',
                      ),
                    ),
                  ],
                ),
                Text(
                  "Product Description: ",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "${Shoes.shoeslist[shoeindex]['description']}",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'regular',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
