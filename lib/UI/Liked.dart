import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Tips.dart';
import 'constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikedTips extends StatefulWidget {

  @override
  State<LikedTips> createState() => _LikedTipsState();
}
class _LikedTipsState extends State<LikedTips> {
  final fireStoreRef = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: fireStoreRef,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> likedAdvices = snapshot.data!.get("LikedAdvices").cast<String>();
            return ListView.builder(
              itemCount: likedAdvices.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(likedAdvices[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          likedAdvices.remove(likedAdvices[index]);
                          await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                            "LikedAdvices": likedAdvices
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
      );
  }

}
