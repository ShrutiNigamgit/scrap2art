import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrap2art/utils.dart';
import 'BuyPage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  final chooseType = TextEditingController();
  bool productType = true;
  final price = TextEditingController();

  // Create a list of options for the dropdown menu
  List<String> productTypes = ['Raw', 'Furnished'];
  String selectedProductType = ''; // Set a default selected value

  // Here we are defining a variable to store the image file.
  File? _image;
  final picker = ImagePicker();

  // This function is used to get the image from the gallery.
  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null)
        _image = File(pickedFile.path);
      else
        Utils().toastMessage("No image selected");
    });
  }

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
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
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0x408E97FD),
                          radius: 60,
                          child: _image != null
                              ? Image.file(_image!.absolute)
                              : Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 60,
                                ),
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
                  // Dropdown list for type of product
                  DropdownButtonFormField<String>(
                    onChanged: (String? newValue) {
                      setState(() {
                        productType = newValue == 'Raw' ? true : false;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text("Furnished"),
                        value: 'Furnished',
                      ),
                      DropdownMenuItem(
                        child: Text("Raw"),
                        value: 'Raw',
                      )
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type of Product',
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
                    onTap: () async {
                      firebase_storage.Reference ref = storage
                          .ref()
                          .child("ProductImages/${DateTime.now()}");

                      firebase_storage.UploadTask uploadTask =
                          ref.putFile(_image!);

                      await Future.value(uploadTask);
                      var downloadURL = await ref.getDownloadURL();
                      print(downloadURL.toString());

                      String id =
                          DateTime.now().millisecondsSinceEpoch.toString();
                      firestore.doc(id).set({
                        "SellerName": sellerName.text.toString(),
                        "SellerPhone": sellerPhone.text.toString(),
                        "ProductName": productName.text.toString(),
                        "Description": description.text.toString(),
                        "Price": price.text.toString(),
                        "ProductImageLink": downloadURL.toString(),
                        "SellerID": "SellerID",
                        "isRaw": productType,
                        "productId": id,
                      }).then((value) {
                        print("Product Added Successfully");
                        Utils().toastMessage("Product Added Successfully");
                      }).onError((error, stackTrace) {
                        print("Error: ${error.toString()}");
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
