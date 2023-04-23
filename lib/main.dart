import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stockx/Screens/HomeScreen.dart';
import 'package:stockx/Screens/SplashScreen.dart';
import 'package:stockx/Screens/WelcomScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     }
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       if (snapshot.data == null) {
      //         return SplashScreen();
      //       } else {
      //         return HomeScreen();
      //       }
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
      home: SplashScreen(),
    );
  }
}
