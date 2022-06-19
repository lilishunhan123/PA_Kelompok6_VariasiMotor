// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kelompok6/admin/view_data.dart';
import 'package:kelompok6/controller/adminController.dart';
import 'package:get/get.dart';
import 'package:kelompok6/home_page.dart';
import 'package:kelompok6/login.dart';

class AddDataForm extends StatelessWidget {
  // const AddDataForm({Key? key}) : super(key: key);
  // FirebaseStorage storage = FirebaseStorage.instance;

  final AdminController ac = AdminController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 28, 37),
      appBar: AppBar(
        title: Text("Add Data Form"),
        backgroundColor: Color.fromARGB(255, 159, 17, 24),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 159, 17, 24),
              ),
              child: Text(
                'Nama Aplikasi',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Data Produk'),
              onTap: () {
                Get.to(ViewPage());
              },
            ),
            ListTile(
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "OUR TEAM",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 159, 17, 24)),
                        ),
                        content: Container(
                          height: 160,
                          child: Column(
                            children: [
                              ListTile(
                                subtitle: Column(
                                  children: [
                                    Text("Abdullah Gymnastiar Ali"),
                                    Text("(1915016025)")
                                  ],
                                ),
                              ),
                              ListTile(
                                subtitle: Column(
                                  children: [
                                    Text("Lilis Sugiarti"),
                                    Text("(1915016086)")
                                  ],
                                ),
                              ),
                              ListTile(
                                subtitle: Column(
                                  children: [
                                    Text("Rifqi Aditya Pranata"),
                                    Text("(1915016180)")
                                  ],
                                ),
                              ),
                              ListTile(
                                subtitle: Column(
                                  children: [
                                    Text("Ahmad Fauzy"),
                                    Text("(2009106149)")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Tutup",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                Get.to(Home());
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(-5, 0),
                  blurRadius: 15,
                  spreadRadius: 3,
                ),
              ],
            ),
            width: width,
            height: height,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: ac.namaProdukController,
                        decoration: InputDecoration(hintText: "Nama Produk"),
                      ),
                      TextField(
                        controller: ac.hargaProdukController,
                        decoration: InputDecoration(hintText: "Harga"),
                        keyboardType: TextInputType.number,
                      ),
                      TextButton(
                        onPressed: ac.selectFile,
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 100,
                              child: Text(
                                "Select File: ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 159, 17, 24)),
                              ),
                            ),
                            if (ac.pickedFile != null)
                              Container(
                                width: 100,
                                height: 100,
                                child: Text(ac.pickedFile!.name),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: Color.fromARGB(255, 159, 17, 24),
                      ),
                      child: Text(
                        'Add Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        // ADD DATA HERE
                        ac.upload(products, ac.namaProdukController,
                            ac.hargaProdukController);

                        // nameController.text = "";
                        // ageController.text = "";
                        // users.add({
                        //   'name': nameController.text,
                        //   'age': int.tryParse(ageController.text) ?? -1,
                        // });

                        // nameController.text = '';
                        // ageController.text = '';
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
