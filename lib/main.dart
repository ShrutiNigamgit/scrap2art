import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scrap2art/UI/HomePage.dart';
import 'package:scrap2art/registrationPages/initial_Welcome_Screen.dart';
import 'package:scrap2art/registrationPages/loginPage.dart';
import 'package:scrap2art/registrationPages/signUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'initial_Welcome_Screen',
      routes: {
        'initial_Welcome_Screen': (context) => HomePage(),
       // 'initial_Welcome_Screen': (context) => initialWelcomeScreen(),
        // 'signUpPage': (context) => signUpPage(),
        // 'loginPage': (context) => loginPage(),
      }));
}
