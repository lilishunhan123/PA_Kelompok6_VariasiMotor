import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kelompok6/login.dart';

class RegisterController extends GetxController {
  var username = "".obs;
  var password = "".obs;
  var fullName = "".obs;

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController fullNameEditingController = TextEditingController();

  void registar(TextEditingController username, TextEditingController password,
      TextEditingController fullName, CollectionReference users) {
    if (username.text != "" ||
        password.text != "" ||
        fullName.text != "" ||
        username.text != "null" ||
        password.text != "null" ||
        fullName.text != "null") {
      users.add({
        'fullName': fullNameEditingController.text,
        'username': usernameEditingController.text,
        'password': passwordEditingController.text,
      });
      fullNameEditingController.text = "";
      usernameEditingController.text = "";
      passwordEditingController.text = "";

      Get.to(Login());
    } else {
      return null;
    }
  }
}
