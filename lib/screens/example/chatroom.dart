import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class MessageScreen extends StatelessWidget {
  final authController = Get.put(Auth_Controller());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final String recipientId;

  MessageScreen({required this.recipientId});

  final TextEditingController messageController = TextEditingController();

  void _sendMessage(String message) async {
    try {
      await _firestore.collection('messages').add({
        'senderId': _auth.currentUser!.uid,
        'recipientId': recipientId,
        'message': message,
        'timestamp': Timestamp.now(),
      });
    } catch (error) {
      print('Error sending message: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('messages')
                  .where('recipientId', isEqualTo: _auth.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                    String senderId = data['senderId'];
                    String message = data['message'];
                    String senderEmail = data['senderEmail']; // sender's email
                    // Add other necessary data fields as per your requirement

                    String senderType = (senderId == _auth.currentUser!.uid) ? 'You' : senderEmail; // Display sender's email

                    return ListTile(
                      title: Text(message),
                      subtitle: Text(senderType),
                    );
                  },
                );
              },
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    String message = messageController.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
