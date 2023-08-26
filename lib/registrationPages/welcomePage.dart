import 'package:flutter/material.dart';
import 'package:scrap2art/UI/HomePage.dart';
import 'signUpPage.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8E97FD),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hi, Welcome',
                style: TextStyle(
                  color: Color(0xFFFFECCC),
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'to Scrap2Art',
                style: TextStyle(
                  color: Color(0xFFFFECCC),
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Declutter, sell your scrap, and earn.',
                style: TextStyle(
                  color: Color(0xFFFFECCC),
                  fontSize: 20,
                ),
              ),
              Text(
                'Transform trash into treasure.',
                style: TextStyle(
                  color: Color(0xFFFFECCC),
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset('assets/Declutter.png'),
                      SizedBox(height: 8),
                      Text(
                        'Declutter Scrap',
                        style: TextStyle(
                          color: Color(0xFFFFECCC),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/sell_and_earn.png'),
                      SizedBox(height: 8),
                      Text(
                        'Sell & Earn',
                        style: TextStyle(
                          color: Color(0xFFFFECCC),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Image.asset('assets/customised_product.png'),
              SizedBox(height: 8),
              Text(
                'Sell your Customised Product ',
                style: TextStyle(
                  color: Color(0xFFFFECCC),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                  onTap:(){Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));},

                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFEBEAEC),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'GET STARTED',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
