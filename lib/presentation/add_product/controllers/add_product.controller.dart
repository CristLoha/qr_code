import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  RxBool isLoading = false.obs;
  late FirebaseAuth auth;
  final TextEditingController codeC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController qtyC = TextEditingController();

  Future<Map<String, dynamic>> addProduct(Map<String, dynamic> data) async {
    try {
      return {
        "error": false,
        "message": "Berhasil menambah product.",
      };
    } catch (e) {
      return {
        /// Error General
        "error": true,
        "message": "Tidak dapat menambah product",
      };
    }
  }
}
