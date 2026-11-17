import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management/view/auth_view/set_new_password_view.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text('6-digit code',
                    style: TextStyle(fontSize: 28,
                        fontWeight: FontWeight.bold
                    )
                ),
                const SizedBox(height: 12),
                const Text(
                    "Please enter the code we've sent to\nmichelle.rivera@example.com",
                    style: TextStyle(fontSize: 14,
                        color: Color(0xFF6B7280),
                        height: 1.5)
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildOtpInputField(context, first: true, last: false),
                    buildOtpInputField(context, first: false, last: false),
                    buildOtpInputField(context, first: false, last: false),
                    buildOtpInputField(context, first: false, last: false),
                    buildOtpInputField(context, first: false, last: false),
                    buildOtpInputField(context, first: false, last: true),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF84C900),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 0
                    ),
                    onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SetNewPasswordView()),
                        );
                      },

                    child: const Text('Confirm',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)
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

  Widget buildOtpInputField(BuildContext context, {required bool first, required bool last}) {
    return SizedBox(
      width: 45, height: 52,
      child: TextField(
        autofocus: first,
        onChanged: (value) {
          if (value.length == 1 && !last) FocusScope.of(context).nextFocus();
          if (value.isEmpty && !first) FocusScope.of(context).previousFocus();
        },
        showCursor: false,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF5FFF0),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
