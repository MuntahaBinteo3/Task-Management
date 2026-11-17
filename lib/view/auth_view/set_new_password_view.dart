import 'package:flutter/material.dart';
import 'package:task_management/view/auth_view/taskmanagerapp.dart';


class SetNewPasswordView extends StatefulWidget {
  const SetNewPasswordView({super.key});

  @override
  State<SetNewPasswordView> createState() => _SetNewPasswordViewState();
}

class _SetNewPasswordViewState extends State<SetNewPasswordView> {
  bool _isObscureNewPass = true;
  bool _isObscureConfirmPass = true;

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
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        const Text(
                          'Set Your New Password',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Create a secure password to protect your account and get started seamlessly!',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF6B7280),
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'New Password',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          obscureText: _isObscureNewPass,
                          decoration: customInputDecoration('••••••••').copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscureNewPass ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              onPressed: () => setState(() => _isObscureNewPass = !_isObscureNewPass),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'New Confirm Password',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          obscureText: _isObscureConfirmPass,
                          decoration: customInputDecoration('••••••••').copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscureConfirmPass ?
                                Icons.visibility_off_outlined :
                                Icons.visibility_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              onPressed: () => setState(() => _isObscureConfirmPass = !_isObscureConfirmPass
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF84C900),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const TaskManagerApp()),
                                    (route) => false,
                              );
                            },
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
                        const SizedBox(height: 10),
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

  InputDecoration customInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
      filled: true,
      fillColor: const Color(0xFFF5FFF0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
