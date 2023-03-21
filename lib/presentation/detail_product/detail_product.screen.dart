import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/detail_product.controller.dart';

class DetailProductScreen extends GetView<DetailProductController> {
  const DetailProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailProductScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
