import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/app/controllers/auth_controller.dart';
import 'package:qr_code/infrastructure/navigation/routes.dart';

class HomeLogout extends StatelessWidget {
  final AuthController authC = Get.find<AuthController>();
  HomeLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        Map<String, dynamic> hasil = await authC.logout();
        if (hasil["error"] == false) {
          Get.offAllNamed(Routes.login);
        } else {
          Get.snackbar('Error', hasil["error"]);
        }
      },
      child: const Icon(Icons.logout),
    );
  }
}
