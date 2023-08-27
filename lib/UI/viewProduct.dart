import 'package:flutter/material.dart';
import 'package:scrap2art/registrationPages/welcomePage.dart';
import 'SellPage.dart';
import 'BuyPage.dart';
class viewProduct extends StatefulWidget {
  const viewProduct({super.key});

  @override
  State<viewProduct> createState() => _viewProductState();
}
class _viewProductState extends State<viewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Navigator.pop(context); // Go back to previous screen
                  },
                ),

                Image.asset('assets/Whitelogo.jpeg',width:130,height:80),
              ],
            ),
            // Add more widgets here, such as text, images, buttons, etc.
            Text("Product Details"),
            ElevatedButton(
              onPressed: () {
                // Do something when the button is pressed
              },
              child: Text("Buy Now"),
            ),
          ],
        ),
      ),
    );
  }
}
