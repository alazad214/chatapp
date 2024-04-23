import 'package:chatapp/widgets/custom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_TextField.dart';
import '../widgets/message_list.dart';

class Message_Screen extends StatelessWidget {
  Message_Screen({Key? key}) : super(key: key);
  final TextEditingController message = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  final sendMessage = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Message_List(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Chat_TextField(
                    hinttext: "Send Message",
                    controller: message,
                  ),
                ),
                const SizedBox(
                    width:
                        8), // Add some space between TextField and IconButton
                IconButton(
                  onPressed: () {
                    if (message.text.isNotEmpty) {
                      sendMessage.collection("Messages").doc().set({
                        "message": message.text.trim(),
                        "user": currentUser!.email.toString(),
                        "time": DateTime.now()
                      });

                      message.clear();
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: Custom_Drawer(),
    );
  }
}
