import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scrap2art/UI/Chat/ChatPage.dart';

class AllChats extends StatefulWidget {
  const AllChats({super.key});

  @override
  State<AllChats> createState() => _AllChatsState();
}

class _AllChatsState extends State<AllChats> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Chats'),
        ),
        body: _buildAllChats());
  }
}

Widget _buildAllChats() {
  String senderId = FirebaseAuth.instance.currentUser!.uid;
  final firestoreUserRef =
      FirebaseFirestore.instance.collection('users').doc(senderId);

  return StreamBuilder(
    stream: firestoreUserRef.snapshots(),
    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!.data() as Map<String, dynamic>;
        print("data from data object " + data["receivers"].toString());

        return ListView.builder(
          itemCount: data["receivers"].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                String receiverId = data["receivers"][index];
                String receiverName =
                    await getReceiverNameFromID(data["receivers"][index]);
                print("receiver name is " + receiverName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      receiverId: receiverId,
                      receiverName: receiverName,
                    ),
                  ),
                );
              },
              child: _buildChatTile(data["receivers"][index]),
            );
          },
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

Widget _buildChatTile(data) {
  return FutureBuilder(
      future: getReceiverNameFromID(data),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(snapshot.data!),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

Future<String> getReceiverNameFromID(String userID) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    // Replace 'documentId' with the actual ID of the document you want to fetch
    DocumentSnapshot documentSnapshot =
        await firestore.collection('users').doc(userID).get();

    if (documentSnapshot.exists) {
      // Access the 'userid' field value from the document
      String name = documentSnapshot['Name'];
      return name;
    } else {
      print('Document does not exist');
      return "name not found";
    }
  } catch (e) {
    print('Error fetching user data: $e');
    return "some error occured";
  }
}
