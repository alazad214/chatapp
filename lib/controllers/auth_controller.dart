import 'package:chatapp/auth/login_screen.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth_Controller extends GetxController {
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");
  RxString name = RxString("");
  RxString address = RxString("");
  RxString phone = RxString("");

  RxBool isloading = RxBool(false);

  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SignUp() async {
    if (password.value != confirmpassword.value) {
      Get.snackbar("Invalid password", "Password doesn't matched");
      return;
    }
    isloading.value = true;
    update();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) async {
        if (value.user != null) {
          isloading.value = false;
          await _firestore.collection('users').doc(value.user!.email).set({
            'email': value.user!.email,
            'uid': value.user!.uid,
          });
          update();
          Get.offAll(Home_Screen());
        }
      });
    } on FirebaseAuthException catch (error) {
      isloading.value = false;
      update();

      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  Log_In() async {
    isloading.value = true;
    update();
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) async {
        if (value.user != null) {
          isloading.value = false;
          update();
          DocumentSnapshot userDoc =
              await _firestore.collection('users').doc(value.user!.email).get();
          if (!userDoc.exists) {
            await _firestore.collection('users').doc(value.user!.uid).set({
              'email': value.user!.email,
              'uid': value.user!.uid,
            });
          }
          Get.offAll(Home_Screen());
          Get.snackbar("Success", "Login Successfully");
        }
      });
    } on FirebaseAuthException catch (error) {
      isloading.value = false;
      update();
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  Future signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signOut().then((value) {
        Get.offAll(LogIn_Screen());
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error",e.message?? "something wrong");
    }
  }
}
