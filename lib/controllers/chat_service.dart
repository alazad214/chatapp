import 'package:chatapp/controllers/message_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Chat_Service extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//Send Message---->>>
  Future<void> SendMessage(String receivedID, String message) async {
    final currentuserid = firebaseAuth.currentUser!.uid;
    final currentUseremail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    Message newmessage = Message(
      senderId: currentuserid,
      senderEmail: currentUseremail,
      recievedId: receivedID,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentuserid, receivedID];
    ids.sort();
    String chatRoomId = ids.join("_");

    await firestore
        .collection("chat_room")
        .doc(chatRoomId)
        .collection("messages")
        .add(newmessage.ToMap());
  }

  //Get Message---->>>
  Stream<QuerySnapshot> getMessage(String userid, String otherUserID) {
    List<String> ids = [userid, otherUserID];
    ids.sort();
    String chatRoomId = ids.join("_");
    return firestore
        .collection("chat_room")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
