import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelompok6/home_page.dart';
import 'package:kelompok6/normal_user/users_homepage.dart';

class UsersHomePage extends StatelessWidget {
  // const UsersHomePage({Key? key}) : super(key: key);
  var namaUser;
  var username;
  UsersHomePage(nama, username) {
    this.namaUser = nama;
    this.username = username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Home"),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Welcome, ${namaUser}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            )),
            Center(
                child: Text(
              "Nama Lengkap: \t\t ${namaUser}!",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            )),
            Center(
                child: Text("Username: \t\t\t\t\t\t\t\t\t\t\t ${username}",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w500)))
          ],
        ),
      ),
    );
  }
}
