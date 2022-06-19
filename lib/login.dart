import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelompok6/admin/add_data.dart';
import 'package:kelompok6/controller/loginController.dart';
import 'package:kelompok6/home_page.dart';
import 'package:kelompok6/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatelessWidget {
  final LoginController lc = LoginController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');

    // backgroundColor: Color.fromARGB(255, 238, 28, 37),
    // appBar: AppBar(
    //   title: const Text("Selamat datang di RCB Ala-Ala"),
    //   backgroundColor: Color.fromARGB(255, 159, 17, 24),
    // ),
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 28, 37),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("assets/icon.jpg"),
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Variasi Motor',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                controller: lc.nameController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  floatingLabelStyle:
                      TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  labelText: 'User Name',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                obscureText: true,
                controller: lc.passwordController,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            ListTile(
              title: Text(
                  "Saya menyetujui Syarat dan Ketentuan dan Kebijakan Privasi yang berlaku"),
              leading: Checkbox(
                  value: lc.nilai.value,
                  onChanged: (bool? value) {
                    lc.nilai.value = value!;
                  }),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.black),
                onPressed: () {
                  if (lc.nameController == "admin" &&
                      lc.passwordController == "admin") {
                    print("tes");
                    Get.off(AddDataForm());
                  } else {
                    lc.auth(lc.nameController, lc.passwordController, users);
                  }
                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {
                    Get.to(Regista());
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
    //
  }
}
