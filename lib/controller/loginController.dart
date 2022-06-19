import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kelompok6/admin/add_data.dart';
import 'package:kelompok6/admin/admin_homepage.dart';
import 'package:kelompok6/landing_page.dart';
import 'package:kelompok6/normal_user/users_homepage.dart';
import 'package:kelompok6/normal_user/users_landing_page.dart';

class LoginController extends GetxController {
  var nilai = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> auth(TextEditingController nc, TextEditingController pc,
      CollectionReference user) async {
    try {
      if (nc.text == "admin" && pc.text == "admin") {
        // print("ajax");
        Get.off(AdminHomepage());
        // return null;
      } else {
        user
            .where('username', isEqualTo: nc.text)
            .where('password', isEqualTo: pc.text)
            .snapshots()
            .listen(
          (data) {
            print(data.docs.length);
            print(
              'Name ${data.docs[0]['username']}',
            );
            Get.to(UsersHomePage(
                data.docs[0]['fullName'], data.docs[0]['username']));
          },
        );
      }
      // print("tes");

    } on Exception catch (e) {
      print(e.toString());
    }
    // print("testingaja");
    // print(user.);
  }
}

class ItemCard extends StatelessWidget {
  final String name;
  final String age;
  //// Pointer to Update Function

  ItemCard(this.name, this.age);

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xfff78000))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                "$age years old",
              )
            ],
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
