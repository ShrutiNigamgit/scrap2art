import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Models/item.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final fireStoreRef =
      FirebaseFirestore.instance.collection("Products").snapshots();
  bool raw = false;
  final selectedStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff8E97FD));

  final unSelectedStyle = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Buy at affordable rates',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
                          style: raw == false ? selectedStyle : unSelectedStyle,
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
                          style: raw == true ? selectedStyle : unSelectedStyle,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8, // Adjust as needed
                        ),
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = products[index];
                          return Card(
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
                                      placeholder: (context, url) =>
                                          Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            Expanded(child: Container()),
                                            Text(
                                              "₹${product['Price']}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              product['ProductName'],
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        Icon(
                                          Icons.call,
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  })
            ],
          )),
    );
  }
}
