class Message {
  final String sentByID;
  final String sendToID;
  final String message;
  final String time;
  final String senderName;
  final String receiverName;

  Message(
      {required this.sentByID,
      required this.sendToID,
      required this.message,
      required this.time,
      required this.senderName,
      required this.receiverName
      });

  Map<String, dynamic> toMap() {
    return {
      "sendBy": sentByID,
      "sendTo": sendToID,
      "message": message,
      "time": time,
      "senderName": senderName,
      "receiverName": receiverName
    };
  }
}
