import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat_Screen extends StatelessWidget {
  Chat_Screen({super.key, this.data});
  final QueryDocumentSnapshot<Map<String, dynamic>>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(data?["email"]),
        titleSpacing: 0,
      ),
    );
  }
}
