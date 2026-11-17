
import 'package:flutter/material.dart';
import 'package:get_x/get.dart' show Obx;
import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_instance/src/extension_instance.dart';
import 'package:get_x/get_navigation/src/extension_navigation.dart';

import 'package:task_management/Constant/colors.dart';
import 'package:task_management/utils/custom_text.dart';
import 'package:task_management/view/auth_view/create_account_view.dart';
import 'package:task_management/view/auth_view/custom_loader.dart';
import 'custom_toast_message.dart' show CustomToast;


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  final LoginController loginController = Get.put(loginController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery
                  .sizeOf(context)
                  .height * 0.23),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Stay productive and take control of your tasks.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 28),
              CustomTextField(
                label: 'Email Address',
                hint: 'Enter you mail',
                controller: emailController,
              ),
              const SizedBox(height: 18),
              CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: passwordController,
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: Checkbox(
                      value: rememberMe,
                      activeColor: AppColors.maincolor,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text('Remember me', style: TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade400)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade400)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const CreateAccountView());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: AppColors.maincolor, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Obx(() {
                return loginController.isLoading.value
                    ? Center(child: CustomLoader())
                    : SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: CustomButtonWidget(
                    btnColor: AppColors.maincolor,
                    onTap: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        CustomToast.showToast(
                          "All fields are required",
                          isError: true,
                        );
                      } else if (!email.contains('@')) {
                        CustomToast.showToast(
                          "Invalid email address",
                          isError: true,
                        );
                      } else {
                        loginController.login(
                          email: email,
                          password: password,
                        );
                      }
                    },
                    iconWant: false,
                    btnText: 'Log In',
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}


