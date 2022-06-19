import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:kelompok6/admin/view_data.dart';

class AdminController extends GetxController {
  PlatformFile? pickedFile;
  TextEditingController namaProdukController = TextEditingController();
  TextEditingController hargaProdukController = TextEditingController();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    pickedFile = result.files.first;
    print(pickedFile!.name);
  }

  Future upload(CollectionReference products, TextEditingController namaProduk,
      TextEditingController harga) async {
    // final path = '${pickedFile!.name}';
    // print(path);
    // final file = File(pickedFile!.path!);
    // //
    // final ref = FirebaseStorage.instance.ref().child(path);
    // ref.putFile(file);
    products.add({
      'namaProduk': namaProduk.text,
      'harga': int.tryParse(harga.text) ?? -1,
    });
    Get.to(ViewPage());
    // print('tes');
  }

  Future updateProduk(
      CollectionReference products,
      QueryDocumentSnapshot e,
      TextEditingController namaProduk,
      TextEditingController hargaProdukController) async {
    products.doc(e.id).update({
      'namaProduk': namaProdukController.text,
      'harga': int.tryParse(hargaProdukController.text) ?? 0,
    });
    // final path = '${pickedFile!.name}';
    // print(path);
    // final file = File(pickedFile!.path!);
    // //
    // final ref = FirebaseStorage.instance.ref().child(path);
    // ref.putFile(file);
    Get.to(ViewPage());
    // print('tes');
  }
}
