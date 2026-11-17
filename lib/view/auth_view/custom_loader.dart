import 'package:flutter/material.dart';
import 'package:task_management/Constant/colors.dart';


class CustomLoader extends StatelessWidget {
  final double size;

  const CustomLoader({super.key, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
          color: AppColors.maincolor,
          size: size),
    );
  }
}