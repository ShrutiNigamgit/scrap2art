import 'package:flutter/material.dart';
import 'package:scrap2art/registrationPages/loginPage.dart';
import 'package:scrap2art/registrationPages/welcomePage.dart';
class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create your account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF7583CA),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUE WITH FACEBOOK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFEBEAEC),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUE WITH GOOGLE',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'OR LOGIN WITH EMAIL',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFF2F3F7),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFF2F3F7),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email address',
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xFFF2F3F7),
                      ),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => welcomePage()),
                      );
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
                          'GET STARTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>loginPage()));},
                    child: Text(
                      "ALREADY HAVE AN ACCOUNT ?LOG IN",
                      style: TextStyle(
                        color: Color(0xFFA1A4B2),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
