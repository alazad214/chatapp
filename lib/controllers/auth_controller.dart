import 'package:chatapp/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../auth/login.dart';

class AuthController extends GetxController {
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");

  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;

  Register() async {
    if (password.value != confirmpassword.value) {
      Get.snackbar("Invalid password", "Password doesn't matched");
      return;
    }

    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(HomeScreen());
        }
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  LogIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(HomeScreen());
          Get.snackbar("Seccess", "Login Successfully");
        }
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  Future signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signOut().then((value) {
        Get.offAll(LogInScreen());
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "something wrong");
    }
  }
}
