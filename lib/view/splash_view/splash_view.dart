import 'package:flutter/material.dart';
import 'package:task_management/Constant/image.dart';

import 'package:task_management/view/auth_view/management_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Management()),
            );
          },
          child: Image.asset(AppAssets.splashImage),
        ),
      ),
    );
  }
}
