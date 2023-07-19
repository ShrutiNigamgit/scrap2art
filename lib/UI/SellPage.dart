import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scrap2art/utils.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final firestore = FirebaseFirestore.instance.collection("Products");

  // Here we are defining the required controllers. These controllers will be used to get the data from the text fields.
  final sellerName = TextEditingController();
  final sellerPhone = TextEditingController();
  final productName = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();

  @override
  void dispose() {
    // Here we are disposing the controllers to avoid memory leaks.
    sellerName.dispose();
    sellerPhone.dispose();
    productName.dispose();
    description.dispose();
    price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0x408E97FD),
                        radius: 60,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff8E97FD),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          width: 130,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Upload Photo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: sellerName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Seller Name',
                    ),
                  ),
                  TextField(
                    controller: sellerPhone,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Seller Phone ',
                    ),
                  ),
                  TextField(
                    controller: productName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Product Name',
                    ),
                  ),
                  TextField(
                    controller: description,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Description',
                    ),
                  ),
                  TextField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Price',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Discard',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      String id =
                          DateTime.now().millisecondsSinceEpoch.toString();
                      firestore.doc(id).set({
                        "SellerName": sellerName.text.toString(),
                        "SellerPhone": sellerPhone.text.toString(),
                        "ProductName": productName.text.toString(),
                        "Description": description.text.toString(),
                        "Price": price.text.toString(),
                        "ProductImageLink": "imagelink",
                        "SellerID": "SellerID",
                        "isRaw": false,
                        "productId": id,
                      }).then((value) {
                        Utils().toastMessage("Product Added Successfully");
                      }).onError((error, stackTrace) {
                        Utils().toastMessage("Error: ${error.toString()}");
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff8E97FD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
