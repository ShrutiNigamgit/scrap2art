import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Models/Message.dart';
import '../../utils.dart';

void sendMessage(String message, String receiverId, String receiverName) {

  // getting some details about the user. 
  String senderId = FirebaseAuth.instance.currentUser!.uid;
  String sendTime = DateTime.now().millisecondsSinceEpoch.toString();
  String sendto = receiverId;
  String chatRoomId = getChatRoomIdByUserID(receiverId);

  // creating the message object
  Message messageInfo = Message(
      sentByID: senderId,
      sendToID: sendto,
      message: message,
      time: sendTime,
      senderName: "senderName",
      receiverName: receiverName);

  // add the message object to firebase in the chat room
  final fireStore =
        FirebaseFirestore.instance.collection('chatRooms').doc(chatRoomId);

  fireStore.collection("messages").add(messageInfo.toMap()).then((value) {
    print("Message Sent successfully");
  }).onError((error, stackTrace) {
    print("Error: ${error.toString()}");
    Utils().toastMessage("Error: ${error.toString()}");
  });


  // making entries about chat being started in the users, in senders and receivers database.
  informUsersAboutChat(senderId, receiverId);

}

void informUsersAboutChat(String senderId, String receiverId) {
  // Making entry in the senders database
  final firestoreRefSender =
      FirebaseFirestore.instance.collection('users').doc(senderId);
  firestoreRefSender.update({
    "receivers": FieldValue.arrayUnion([receiverId]),
  });

  // making entry in the receivers database
  final firestoreRefReceiver =
      FirebaseFirestore.instance.collection('users').doc(receiverId);
  firestoreRefReceiver.update({
    "receivers": FieldValue.arrayUnion([senderId]),
  });
}



String getChatRoomIdByUserID(String receiverId) {
  String uID = FirebaseAuth.instance.currentUser!.uid;
  if (uID.compareTo(receiverId) > 0) {
    return "$receiverId-$uID";
  } else {
    return "$uID-$receiverId";
  }
}
