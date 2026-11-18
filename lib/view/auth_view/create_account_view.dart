import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:task_management/utils/custom_text.dart';
import 'package:task_management/view/auth_view/custom_toast_message.dart';
import 'package:task_management/view/auth_view/verify_email_view.dart';
import 'package:task_management/utils/signup_controller.dart';


class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<CreateAccountView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();
  final SignupController signupController = Get.put(SignupController());



  bool _isObscurePassword = true;
  bool _isAgreed = false;

 @override
 void dispose(){
   firstNameController.dispose();
   lastNameController.dispose();
   addressController.dispose();
   emailController.dispose();
   passwordController.dispose();
   super.dispose();

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'Create Your Account',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Join Task Manager today — organize better, work smarter.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(label: "First Name",
                            hint:"Enter Your First Name",
                            controller: firstNameController,
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(label: "last Name",
                            hint:"Enter Your last Name",
                            controller: lastNameController,
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(label: "Address",
                            hint:"Enter Your Address",
                            controller: addressController,
                        ),
                        const SizedBox(height: 24),
                        CustomTextField(label: "Email Address",
                            hint:"Enter Your Email Address",
                            controller:emailController,
                        ),

                        buildFormLabel('PassWord'),
                        TextField(
                          obscureText: _isObscurePassword,
                          decoration: buildInputDecoration('••••••••').copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              onPressed: () => setState(
                                () => _isObscurePassword = !_isObscurePassword,
                              ),
                            ),
                          ),
                        ),


                        Row(
                          children: [
                            Checkbox(
                              value: _isAgreed,
                              activeColor: const Color(0xFF84C900),
                              onChanged: (value) =>
                                  setState(() => _isAgreed = value!),
                            ),
                            const Expanded(
                              child: Text(
                                'I agree to the Terms & Conditions and Privacy Policy.',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account? ",
                              style: TextStyle(fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  color: Color(0xFF84C900),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),
                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            ontap: () {
                              final firstName = firstNameController.text.trim();
                              final lastName = lastNameController.text.trim();
                              final address= addressController.text.trim();
                              final email = emailController.text.trim();
                              final password = passwordController.text.trim();

                              if (firstName.isEmpty||
                                 lastName.isEmpty||
                                 address.isEmpty||
                                 email.isEmpty||
                                  password.isEmpty){
                               CustomToast.showToast(
                                  "All fields are required",
                                   isError: true,
                               );
                              } else if(!email.contains("@")) {
                                CustomToast.showToast("Invalid email address",
                                  isError: true,
                                );}
                              else{
                              signupController.registerUser(
                                firstName:firstName,
                                lastName:lastName,
                                address:address,
                                email:email,
                                password:password,
                              );}
                            },
                            onPressed: _isAgreed
                                ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifyEmailView(),
                                    ),
                                  )
                                : null,
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildFormLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildFormTextField(String hint, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        keyboardType: type,
        decoration: buildInputDecoration(hint),
      ),
    );
  }

  InputDecoration buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF84C900)),
      ),
    );
  }
}
