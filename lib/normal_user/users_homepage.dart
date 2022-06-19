import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kelompok6/home_page.dart';
import 'package:kelompok6/widgets/item_card.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersViewData extends StatelessWidget {
  const UsersViewData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 238, 28, 37),
        appBar: AppBar(
          title: Text("List Produk"),
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
                  'Variasi Motor',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                title: const Text('List Produk'),
                onTap: () {
                  Get.to(UsersViewData());
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
                  Get.off(Home());
                },
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                // // VIEW DATA HERE
                StreamBuilder<QuerySnapshot>(
                  stream: products.snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {
                                      launch(
                                          "https://wa.me/6283140550032?text=Saya%20tertarik%20dengan%20${e.get('namaProduk')}%20Anda%20yang%20jual");
                                    },
                                    child: ItemCardUsers(
                                      e.get('namaProduk'),
                                      e.get('harga'),
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : Text('Loading...');
                  },
                ),
                SizedBox(height: 150)
              ],
            ),
          ],
        ));
  }
}