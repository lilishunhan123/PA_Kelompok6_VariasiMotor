import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/src/painting/image_resolution.dart';
import 'package:kelompok6/landing_page.dart';
import 'package:kelompok6/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Variasi Motor"),
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
              title: const Text('Log In'),
              onTap: () {
                Get.to(Login());
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
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 238, 28, 37),
      // appBar: AppBar(
      //   title: const Text("Selamat datang di RCB Ala-Ala"),
      //   backgroundColor: Color.fromARGB(255, 159, 17, 24),
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage("assets/home.jpg"),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // fit: BoxFit.cover,
            ),
          ),
          // Align()
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: ((_) => Login())));
              },
            ),
          ),
        ],
      ),
    );
  }
}
