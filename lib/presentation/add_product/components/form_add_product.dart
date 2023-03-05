import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/presentation/add_product/controllers/add_product.controller.dart';
import 'package:qr_code/utils/extension/box_extension.dart';
import '../../../widgets/app_input.dart';

class FormAddProduct extends StatelessWidget {
  final controller = Get.put(AddProductController());
  FormAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInput(
          controller: controller.codeC,
          obscureText: false,
          maxLenght: 10,
          keyboardType: TextInputType.number,
          labelText: 'Product Code',
          autoCorrect: false,
        ),
        20.heightBox,
        AppInput(
          controller: controller.nameC,
          obscureText: false,
          keyboardType: TextInputType.text,
          labelText: 'Product Name',
          autoCorrect: false,
        ),
        20.heightBox,
        AppInput(
          controller: controller.qtyC,
          obscureText: false,
          keyboardType: TextInputType.number,
          labelText: 'Quantity',
          autoCorrect: false,
        ),
        35.heightBox,
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              if (controller.isLoading.isFalse) {
                if (controller.codeC.text.isNotEmpty &&
                    controller.nameC.text.isNotEmpty &&
                    controller.qtyC.text.isNotEmpty) {
                  controller.isLoading(true);
                  Map<String, dynamic> hasil = await controller.addProduct({
                    "code": controller.codeC.text,
                    "name": controller.nameC.text,
                    "qty": int.tryParse(controller.qtyC.text) ?? 0,
                  });
                  controller.isLoading(false);
                  Get.back();
                  Get.snackbar(hasil["error"] == true ? "Error" : "Success",
                      hasil["message"]);
                } else {
                  Get.snackbar("Error", "Semua data wajib diisi");
                }
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: Obx(() => Text(
                  controller.isLoading.isFalse ? 'ADD PRODUCT' : 'LOADING...',
                )),
          ),
        ),
      ],
    );
  }
}
