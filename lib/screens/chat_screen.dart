import 'package:chatapp/controllers/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat_Screen extends StatefulWidget {
  Chat_Screen({
    super.key,
    this.data,
  });
  final QueryDocumentSnapshot<Map<String, dynamic>>? data;

  @override
  State<Chat_Screen> createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  TextEditingController messagecontroller = TextEditingController();
  final controller = Get.put(Chat_Service());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.data?["email"]),
        titleSpacing: 0,
      ),
    );
  }
}
