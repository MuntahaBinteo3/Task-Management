import 'package:flutter/material.dart';
import 'package:task_management/view/auth_view/Login_View.dart';
import 'package:task_management/view/auth_view/OTP%20_view.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          const Text('Verify Your Email',
                              style: TextStyle(fontSize: 28,
                                  fontWeight: FontWeight.bold)
                          ),
                          const SizedBox(height: 12),
                          const Text(
                              "We'll send a verification code to this email to confirm your account.",
                              style: TextStyle(fontSize: 14,
                                  color: Color(0xFF6B7280),
                                  height: 1.5)
                          ),
                          const SizedBox(height: 32),
                          const Text(
                              'Email Address',
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w500)
                          ),
                          const SizedBox(height: 8),
                          TextField(keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(hint:Text('Enter your Email')),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF84C900),
                                shape: RoundedRectangleBorder(borderRadius:
                                BorderRadius.circular(10)
                                ),
                                elevation: 0
                            ),
                            onPressed: () =>
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const OtpView()
                                    )
                                ),
                            child: const Text('Send ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}