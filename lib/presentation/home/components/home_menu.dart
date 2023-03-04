import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code/infrastructure/navigation/routes.dart';
import 'package:qr_code/utils/extension/box_extension.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        late String title;
        late IconData icon;
        late VoidCallback onTap;

        switch (index) {
          case 0:
            title = "Add Product";
            icon = Icons.post_add_rounded;
            onTap = () => Get.toNamed(Routes.addProduct);
            break;
          case 1:
            title = "Produts";
            icon = Icons.list_alt_outlined;
            onTap = () => Get.toNamed(Routes.products);
            break;
          case 2:
            title = "QR CODE";
            icon = Icons.qr_code;
            onTap = () {
              print('OPEN CAMERA');
            };
            break;
          case 3:
            title = "Catalog";
            icon = Icons.document_scanner_outlined;
            onTap = () {
              print('OPEN PDF');
            };
            break;
          default:
        }
        return Material(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(9),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    icon,
                    size: 50,
                  ),
                ),
                10.heightBox,
                Text(title),
              ],
            ),
          ),
        );
      },
    );
  }
}
