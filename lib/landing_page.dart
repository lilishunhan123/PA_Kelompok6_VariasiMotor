import 'package:flutter/material.dart';

class landing_p extends StatefulWidget {
  const landing_p({Key? key}) : super(key: key);

  @override
  State<landing_p> createState() => _landing_pState();
}

class _landing_pState extends State<landing_p> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 28, 37),
        appBar: AppBar(
          title: const Text("Produk Toko"),
          automaticallyImplyLeading: true,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          backgroundColor: Color.fromARGB(255, 159, 17, 24),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: ListView(
          children: [
            Container(
              child: Image(
                image: AssetImage("assets/rem.jpg"),
              ),
            ),
            Container(
              child: Image(
                image: AssetImage("assets/kaliper.jpg"),
              ),
            ),
            Container(
              child: Image(
                image: AssetImage("assets/velg.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
