import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelompok6/controller/loginController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kelompok6/controller/registerController.dart';

class Regista extends StatelessWidget {
  final RegisterController rc = RegisterController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('user');
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Create an Account"),
      // ),
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
                'Register Form',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                controller: rc.fullNameEditingController,
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
                    labelText: 'Nama Lengkap',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                controller: rc.usernameEditingController,
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
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                obscureText: true,
                controller: rc.passwordEditingController,
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
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.black),
                onPressed: () => rc.registar(
                    rc.usernameEditingController,
                    rc.passwordEditingController,
                    rc.fullNameEditingController,
                    users),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
