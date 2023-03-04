import 'package:flutter/material.dart';

import 'components/loading_view.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingView(),
    );
  }
}
