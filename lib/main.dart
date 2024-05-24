import 'dart:io';
import 'package:chatapp/route/route.dart';
import 'package:chatapp/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // এই লাইনটি নিশ্চিত করে যে উইজেট বাইন্ডিং ইনিশিয়ালাইজড হয়েছে
  await Firebase.initializeApp();
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "chatapp",
    options: Platform.isAndroid
        ? const FirebaseOptions(
            apiKey: "AIzaSyB2cTzY6CbQT6v0fyGQDQsIrF_zhAkIHEg",
            appId: "1:132106542439:android:eaa8327b77867de77fe3c2",
            messagingSenderId: "132106542439",
            projectId: "chat-app-bd883",
          )
        : const FirebaseOptions(
            apiKey: "AIzaSyDHP0hfttdU2Ze4oCEmvn_5exbGxzwYxzc",
            appId: "1:132106542439:ios:47f1158cd3a1ae097fe3c2",
            messagingSenderId: "132106542439",
            projectId: "chat-app-bd883",
          ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}
