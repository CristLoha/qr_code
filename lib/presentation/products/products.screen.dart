import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/products.controller.dart';

class ProductsScreen extends GetView<ProductsController> {
  const ProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRODUCTS'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                height: 100,
                child: Row(
                  children: [Text("Data")],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
