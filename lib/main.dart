import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/app/controllers/auth_controller.dart';
import 'package:qr_code/presentation/loading/loading_screen.dart';
import 'firebase_options.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var initialRoute = await Routes.initialRoute;
  runApp(
    Main(initialRoute),
  );
  Get.put(AuthController(), permanent: true);
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute, {super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (context, snapAuth) {
          if (snapAuth.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }

          return GetMaterialApp(
            title: 'Qr Code',
            debugShowCheckedModeBanner: false,
            initialRoute: snapAuth.hasData ? Routes.home : initialRoute,
            getPages: Nav.routes,
          );
        });
  }
}
