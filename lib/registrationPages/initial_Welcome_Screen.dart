import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scrap2art/registrationPages/loginPage.dart';
import 'package:scrap2art/registrationPages/signUpPage.dart';

class initialWelcomeScreen extends StatefulWidget {
  const initialWelcomeScreen({super.key});

  @override
  State<initialWelcomeScreen> createState() => _initialWelcomeScreenState();
}

class _initialWelcomeScreenState extends State<initialWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Scrap2Art",
                style: TextStyle(
                  color: Color(0xFF8E97FD),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                )),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/Vector.png",
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "We are what we do",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20, 20.0, 20),
              child: Text(
                "Sell your scrap items, unlock your artistic potential,and support sustainable living with Scrap2Art",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => signUpPage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF7583CA),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                    child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {

                // this is just for testing the firebase autenticatio and it works
                // FirebaseAuth.instance
                //     .createUserWithEmailAndPassword(
                //         email: "a@b.com", password: "Xerox123")
                //     .then((value) {
                //   print("new user created succesfully"); 
                //   return Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => loginPage()));
                // }).onError((error, stackTrace) =>
                //         print("error,${error.toString()} "));


                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginPage()));
              },
              child: Text(
                "ALREADY HAVE AN ACCOUNT? LOG IN",
                style: TextStyle(
                  color: Color(0xFFA1A4B2),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
