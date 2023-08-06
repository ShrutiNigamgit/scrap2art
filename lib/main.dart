import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scrap2art/registrationPages/initial_Welcome_Screen.dart';
import 'UI/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Call isLogin to handle navigation based on user's login status
  isLogin();
}

void isLogin() {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: user != null ? HomePage() : initialWelcomeScreen(),
    routes: {
      'initial_Welcome_Screen': (context) => initialWelcomeScreen(),
    },
  ));
}
