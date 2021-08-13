import 'package:flutter/material.dart';
import 'screen/welcome_screen.dart';
import 'screen/chat_screen.dart';
import 'screen/registration_screen.dart';
import 'screen/login_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // エラー時に表示するWidget
        if (snapshot.hasError) {
          return Container(color: Colors.white);
        }

        // Firebaseのinitialize完了したら表示したいWidget
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (BuildContext context) => WelcomeScreen(),
              LoginScreen.id: (BuildContext context) => LoginScreen(),
              RegistrationScreen.id: (BuildContext context) =>
                  RegistrationScreen(),
              ChatScreen.id: (BuildContext context) => ChatScreen(),
            },
          );
        }

        // Firebaseのinitializeが完了するのを待つ間に表示するWidget
        return Container(
          color: Colors.white,
          child: Center(
            child: SpinKitRotatingCircle(
              color: Colors.blueAccent,
              size: 50.0,
            ),
          ),
        );
      },
    );
  }
}
