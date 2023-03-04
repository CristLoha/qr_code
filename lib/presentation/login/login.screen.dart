import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code/presentation/login/components/login_form.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login '),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            LoginForm(),
          ],
        ));
  }
}
