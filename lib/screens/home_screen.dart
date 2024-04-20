import 'package:chatapp/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_Screen extends StatelessWidget {
  Home_Screen({super.key});

  final controller = Get.put(Auth_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AKTalk",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              onPressed: () {
                controller.signOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    }

                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          primary: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            final data = snapshot.data!.docs[index];

                            return Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  border: Border.all(color: Colors.blueGrey),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Text(data["email"]),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
