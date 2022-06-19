import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelompok6/admin/view_data.dart';
import 'package:kelompok6/home_page.dart';

class AdminHomepage extends StatelessWidget {
  const AdminHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home"),
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
                Get.off(Home());
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Welcome, ADMIN !"),
      ),
    );
  }
}
