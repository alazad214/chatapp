import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message_List extends StatelessWidget {
  Message_List({Key? key});

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Messages")
          .orderBy("time")
          .snapshots(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.blue,
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("Get started a new conversation.."),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          primary: true,
          physics: const ScrollPhysics(),
          itemBuilder: (_, index) {
            QueryDocumentSnapshot data = snapshot.data!.docs[index];

            return Column(
              mainAxisAlignment: currentUser!.email == data['user']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: currentUser!.email == data['user']
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: currentUser!.email == data['user']
                          ? Colors.blue.withOpacity(0.5)
                          : Colors.teal.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["message"],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(data["user"],style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
