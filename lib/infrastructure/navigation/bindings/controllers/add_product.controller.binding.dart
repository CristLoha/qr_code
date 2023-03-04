import 'package:get/get.dart';

import '../../../../presentation/add_product/controllers/add_product.controller.dart';

class AddProductControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
      () => AddProductController(),
    );
  }
}
