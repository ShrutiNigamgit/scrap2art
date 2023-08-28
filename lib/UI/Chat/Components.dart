import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget messageItem(DocumentSnapshot document) {
  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  var alignment = data['sendBy'] == FirebaseAuth.instance.currentUser!.uid
      ? Alignment.centerRight
      : Alignment.centerLeft;

  var color = data['sendBy'] == FirebaseAuth.instance.currentUser!.uid
      ? Color(0xFF8E97FD)
      : Colors.grey.shade200;

  return Align(
    alignment: alignment,
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            data['message'],
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ],
      ),
    ),
  );
}
