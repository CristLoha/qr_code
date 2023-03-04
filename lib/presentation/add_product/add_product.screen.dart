import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/form_add_product.dart';
import 'controllers/add_product.controller.dart';

class AddProductScreen extends GetView<AddProductController> {
  const AddProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          FormAddProduct(),
        ],
      ),
    );
  }
}
