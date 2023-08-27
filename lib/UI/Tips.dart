import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils.dart';
import 'constants.dart';
import 'Liked.dart';

class TipsnTricks extends StatefulWidget {
  const TipsnTricks({super.key});

  @override
  State<TipsnTricks> createState() => _TipsnTricksState();
}

class _TipsnTricksState extends State<TipsnTricks> {
  int index = Random().nextInt(208);
  bool isLiked = false;
  List<String> likedAdvices = [];

  void nextAdvice() {
    setState(() {
      index = Random().nextInt(208);
      isLiked = false;
    });
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        likedAdvices.add(advices[index]);
      } else {
        likedAdvices.remove(advices[index]);
      }
    });
  }

  String selectedImage ="";

  @override
  void initState() {
    super.initState();
    selectRandomImage();
  }

  void selectRandomImage() {
    setState(() {
      int randomIndex = Random().nextInt(imagesList.length-1);
      selectedImage = imagesList[randomIndex];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/Whitelogo.jpeg', width:120, height: 90),
            // Add some spacing between the image and title
            Text(
              "Business Hacks & Tips",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold , color:Colors.black,),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_outline_outlined),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedTips(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF8E97FE),
      body: Center(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  flex:2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),

                      child: Image.asset(selectedImage,fit: BoxFit.fill ,),
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Center(
                    child: Text(
                      advices[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Color(0xFFD1D4EF),
                      ),
                      // onPressed: toggleLike,
                      onPressed: (){
                        toggleLike();
                        saveToCloud(advices[index]);
                      },
                    ),
                    ElevatedButton(
                      onPressed:() {
                        nextAdvice();
                        selectRandomImage();
                      },
                      child: Text("Next Advice"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8E97FE),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveToCloud(String advice) {
    final fireStore = FirebaseFirestore.instance.collection('users');
    String id = FirebaseAuth.instance.currentUser!.uid;
    // Now we are adding the user data to the firestore database.
    // String id = value.user!.uid.toString();
    fireStore.doc(id.toString()).update({
      "LikedAdvices": FieldValue.arrayUnion([advice]),
    }, ).then((value) {
      Utils().toastMessage("Bookmark Saved");
    }).onError((error, stackTrace) {
      print("Error: ${error.toString()}");
      Utils().toastMessage("Error: ${error.toString()}");
    });
  }
}
