import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../Constants/Colors.dart';
import '../Constants/shoes.dart';
import 'HomeScreen.dart';

class ViewAsk extends StatefulWidget {
  const ViewAsk({super.key});

  @override
  State<ViewAsk> createState() => _ViewAskState();
}

class _ViewAskState extends State<ViewAsk> {
  final ref = FirebaseDatabase.instance.ref(Shoes.shoeslist[shoeindex]['name']);
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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              "Asks Placed",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "All the Asks are shown here...",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Price",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(
                child: FirebaseAnimatedList(
                    query: ref,
                    defaultChild: Text('Loading'),
                    itemBuilder: (context, snapshot, animation, index) {
                      return Container(
                        height: 40,
                        margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: ColorsConstant.defaultGreen),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Text(
                                snapshot.child('name').value.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              child: Text(
                                "\$" + snapshot.child('ask').value.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'regular',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      );
                      // return ListTile(
                      //   title: Text(
                      //     snapshot.child('name').value.toString(),
                      //     style: TextStyle(
                      //         fontSize: 14,
                      //         fontFamily: 'regular',
                      //         fontWeight: FontWeight.w400),
                      //   ),
                      //   subtitle: Text(
                      //     "\$" + snapshot.child('bid').value.toString(),
                      //     style: TextStyle(fontSize: 12, fontFamily: 'regular'),
                      //   ),
                      // );
                    }))
          ],
        ),
      ),
    );
  }
}
