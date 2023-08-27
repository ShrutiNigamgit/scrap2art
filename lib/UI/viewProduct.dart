import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scrap2art/registrationPages/welcomePage.dart';
import 'SellPage.dart';
import 'BuyPage.dart';
class viewProduct extends StatefulWidget {
  var product ;
  viewProduct({super.key, required this.product});

  @override
  State<viewProduct> createState() => _viewProductState();
}
class _viewProductState extends State<viewProduct> {

  @override
  Widget build(BuildContext context) {
    final product =widget.product;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

                  Image.asset('assets/Whitelogo.jpeg',width:150,height:90),
                ],
              ),
              Center(
                child: Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: product['ProductImageLink'],alignment: Alignment.center,
                      fit: BoxFit.cover, // Fit the image within the container
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(product['ProductName'],style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold,)),
                Icon(
                  Icons.chat_bubble,
                  color: Color(0xFF8E97FD),
                  size:35,
                ),],),
              SizedBox(height: 20),
              Text("₹"+product['Price'],style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text(product['Description'],style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF666666))),
              SizedBox(height: 40),
              Row(children: <Widget>[
                Text('Seller Name : ' ,style:TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Color(0xFF666666))),
                Text(product['SellerName'],style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black)),
              ],),
              Expanded(child:Container(), flex:3)

            ],
          ),
        ),
      ),
    );
  }
}
