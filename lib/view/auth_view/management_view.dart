import 'package:flutter/material.dart';
import 'package:task_management/Constant/image.dart';
import 'package:task_management/Constant/string.dart';
import 'package:task_management/view/auth_view/Login_View.dart';
import 'package:task_management/view/auth_view/focus_view.dart';

class Management extends StatelessWidget {
  const Management({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Image.asset(AppAssets.component2, height: 250),
                    const SizedBox(height: 30),
                    Text(
                      AppString.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      AppString.descriptionOnboardingOne,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFF84C900),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 6),

                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),

                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 45),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FocusView(),
                        ),
                      );
                    },

                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
