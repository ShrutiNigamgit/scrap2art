import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Components.dart';
import 'chatServices.dart';

class ChatPage extends StatefulWidget {
  final String receiverId;
  final String receiverName;
  const ChatPage(
      {super.key, required this.receiverId, required this.receiverName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          widget.receiverName,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/chat_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  // Chat will be displayed here.
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('chatRooms')
                        .doc(getChatRoomIdByUserID(widget.receiverId))
                        .collection('messages')
                        .orderBy('time', descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return messageItem(snapshot.data!.docs[index]);
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),

                // the user will type the message to send here.
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: messageController,
                            decoration: const InputDecoration(
                              hintText: "Type a message",
                              hintStyle: TextStyle(color: Colors.black),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          if (messageController.text.isNotEmpty) {
                            sendMessage(messageController.text,
                                widget.receiverId, widget.receiverName);
                            messageController.clear();
                          }
                        },
                        child: Icon(
                          Icons.send,
                          color: Color(0xFF8E97FD),
                          size: 35,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
