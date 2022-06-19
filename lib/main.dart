import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelompok6/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = firestore.collection('user');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // getData();
  runApp(const MyApp());
}

Future<void> getData() async {
  // Get docs from collection reference
  users.where('fullName', isEqualTo: 'John Doe').snapshots().listen(
    (data) {
      print(
        'Name ${data.docs[0]['username']}',
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),

      // title: "Post test 4 Ahmad Fauzy 2009106149",
      // home: Scaffold(
      //   backgroundColor: Color.fromARGB(255, 238, 28, 37),
      //   appBar: AppBar(
      //     title: const Text("Post test 4 Ahmad Fauzy 2009106149"),
      //     backgroundColor: Color.fromARGB(255, 159, 17, 24),
      //   ),
      //   body: new Home(),
      // ),
    );
  }
}
