import 'package:flutter/material.dart';
import 'package:scrap2art/registrationPages/initial_Welcome_Screen.dart';
import 'package:scrap2art/registrationPages/loginPage.dart';
import 'package:scrap2art/registrationPages/signUpPage.dart';

void main()
{
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'initial_Welcome_Screen',
      routes: {
        'initial_Welcome_Screen': (context) => initialWelcomeScreen(),
        // 'signUpPage': (context) => signUpPage(),
        // 'loginPage': (context) => loginPage(),

      }));
}