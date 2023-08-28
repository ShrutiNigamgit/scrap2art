import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrap2art/UI/viewProduct.dart';

import '../../Models/item.dart';

class BuyPage extends StatefulWidget {
  final bool raw;

  const BuyPage({Key? key, required this.raw}) : super(key: key);
  @override
  State<BuyPage> createState() => _BuyPageState(raw: raw);
}

class _BuyPageState extends State<BuyPage> {
  final fireStoreRef =
      FirebaseFirestore.instance.collection("Products").orderBy("productId", descending: true).snapshots();
  bool raw;
  final selectedStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff8E97FD));

  final unSelectedStyle = TextStyle(fontSize: 18);

  _BuyPageState({required this.raw});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Text(
                        'Buy at affordable rates',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Image.asset('assets/Whitelogo.jpeg',width:150,height:90),
                    ],
                  ),
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            raw = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Furnished',
                            style:
                                raw == false ? selectedStyle : unSelectedStyle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            raw = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Raw Scrap',
                            style:
                                raw == true ? selectedStyle : unSelectedStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: fireStoreRef,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text("Something went wrong"));
                      }

                      final products = snapshot.data!.docs
                          .where((doc) =>
                              doc['isRaw'] ==
                              raw) // Filtering based on isRaw parameter
                          .toList();

                      return Expanded(
                        child: GridView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8, // Adjust as needed
                          ),
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap:  (){Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  viewProduct( product: product,)),
                              );},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 8,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10.0),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: product['ProductImageLink'],
                                          fit: BoxFit.cover, // Fit the image within the container
                                          placeholder: (context, url) => Center(
                                              child: CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Expanded(child: Container()),
                                                SizedBox(height : 5,),
                                                Text(
                                                  product['ProductName'],
                                                  style: TextStyle(fontSize: 15,fontWeight:
                                                  FontWeight.bold),),

                                                SizedBox(height : 5,),
                                                Text(
                                                  "₹${product['Price']}",
                                                  style: TextStyle(
                                                      color: Color(0xFF8E97FD),
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(height : 5,),
                                                Expanded(child: Container()),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Icon(
                                              Icons.chat_bubble_outline,
                                              color: Color(0xFF8E97FD),
                                              size:18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    })
              ],
            )),
      ),
    );
  }
}
