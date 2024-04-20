import 'package:chatapp/controllers/auth_controller.dart';
import 'package:chatapp/screens/chat_screen.dart';
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
                    final data = snapshot.data!.docs;
                    return SizedBox(
                      child: ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          primary: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(Chat_Screen(
                                  data: data[index],
                                ));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all()),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Text(data[index]["email"]),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.arrow_forward_ios))
                                      ],
                                    ),
                                  )
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
