class Message {
  final String senderId;
  final String senderEmail;
  final String recievedId;
  final String message;
  final  timestamp;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.recievedId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> ToMap() {
    return {
      "senderId": senderId,
      "senderEmail": senderEmail,
      "recievedId": recievedId,
      "message": message,
      "times": timestamp,
    };
  }
}
