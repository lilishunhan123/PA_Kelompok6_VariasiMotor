import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelompok6/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // FirebaseStorage.instance.ref('/files').listAll();
    SS();
  }

  SS() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Get.off(() => Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 2;
    var height = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          "assets/icon-removebg-preview.png",
          width: width / 2,
          height: height / 2,
        ),
      ),
    );
  }
}
