import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/app/controllers/auth_controller.dart';
import 'package:qr_code/infrastructure/navigation/routes.dart';
import 'package:qr_code/presentation/login/controllers/login.controller.dart';
import 'package:qr_code/utils/extension/box_extension.dart';
import '../../../widgets/app_input.dart';

class LoginForm extends StatelessWidget {
  final controller = Get.put(LoginController());
  final AuthController auth = Get.find<AuthController>();
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInput(
          autoCorrect: false,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailC,
          labelText: 'Email',
        ),
        20.heightBox,
        Obx(
          () => AppInput(
            autoCorrect: false,
            suffixIcon: IconButton(
              onPressed: () {
                controller.isHidden.toggle();
              },
              icon: Icon(
                controller.isHidden.isFalse
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
              ),
            ),
            obscureText: controller.isHidden.value,
            keyboardType: TextInputType.text,
            controller: controller.passC,
            labelText: 'Password',
          ),
        ),
        35.heightBox,
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              if (controller.isLoading.isFalse) {
                if (controller.emailC.text.isNotEmpty &&
                    controller.passC.text.isNotEmpty) {
                  controller.isLoading(true);
                  Map<String, dynamic> hasil = await auth.login(
                      controller.emailC.text, controller.passC.text);
                  auth.login(controller.emailC.text, controller.passC.text);
                  controller.isLoading(false);
                  if (hasil['error'] == true) {
                    Get.snackbar('Error', hasil['message']);
                  } else {
                    Get.offAllNamed(Routes.home);
                  }
                } else {
                  Get.snackbar('Error', 'Email dan Password Wajib Diisi');
                }
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: Obx(() => Text(
                  controller.isLoading.isFalse ? 'LOGIN' : 'LOADING...',
                )),
          ),
        ),
      ],
    );
  }
}
