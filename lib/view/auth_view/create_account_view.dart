import 'package:flutter/material.dart';
import 'package:task_management/view/auth_view/Login_View.dart';
import 'package:task_management/view/auth_view/verify_email_view.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<CreateAccountView> {
  bool _isObscurePass = true;
  bool _isObscureConfirmPass = true;
  bool _isAgreed = false;

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
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const Text('Create Your Account',
                            style: TextStyle(fontSize: 26,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const Text('Join Task Manager today — organize better, work smarter.',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6B7280)
                            )
                        ),
                        const SizedBox(height: 24),

                        buildFormLabel('First Name'),
                        buildFormTextField('e.g. Kristin',
                            TextInputType.name),

                        buildFormLabel('Last Name'),
                        buildFormTextField('e.g. Cooper',
                            TextInputType.name),

                        buildFormLabel('Email Address'),
                        buildFormTextField('e.g. kristin.cooper@example.com',
                            TextInputType.emailAddress),

                        buildFormLabel('Address'),
                        buildFormTextField('e.g. 1234 Elm Street',
                            TextInputType.streetAddress),

                        buildFormLabel('PassWord'),
                        TextField(
                          obscureText: _isObscurePass,
                          decoration: buildInputDecoration('••••••••').copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(_isObscurePass ?
                              Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  color: Colors.grey,
                                  size: 20),
                              onPressed: () => setState(() => _isObscurePass = !_isObscurePass),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        buildFormLabel('Confirm Password'),
                        TextField(
                          obscureText: _isObscureConfirmPass,
                          decoration: buildInputDecoration('••••••••').copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(_isObscureConfirmPass ?
                              Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  color: Colors.grey,
                                  size: 20),
                              onPressed: () => setState(() => _isObscureConfirmPass = !_isObscureConfirmPass),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Checkbox(value: _isAgreed,
                                activeColor: const Color(0xFF84C900),
                                onChanged: (value) => setState(() => _isAgreed = value!)
                            ),
                            const Expanded(child:
                            Text('I agree to the Terms & Conditions and Privacy Policy.',
                                style: TextStyle(fontSize: 13)
                            )
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? ",
                                style: TextStyle(fontSize: 14)),
                            GestureDetector(onTap: () => Navigator.pop(context),
                                child: const Text('Log In',
                                    style: TextStyle(color: Color(0xFF84C900),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)
                                )
                            ),
                          ],
                        ),

                        const Spacer(),
                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.
                            styleFrom(backgroundColor:
                            const Color(0xFF84C900),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                elevation: 0),
                            onPressed: _isAgreed ? () =>
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const VerifyEmailView()
                                    )
                                ) : null,
                            child:
                            const Text('Continue',
                                style: TextStyle(color: Colors.white,
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
          },
        ),
      ),
    );
  }

  Widget buildFormLabel(String text) {
    return Padding(padding:
    const EdgeInsets.only(bottom: 6.0),
        child: Text(text, style:
        const TextStyle(fontSize: 13,
            fontWeight: FontWeight.w500)
        )
    );
  }

  Widget buildFormTextField(String hint, TextInputType type) {
    return Padding(padding:
    const EdgeInsets.only(bottom: 16.0),
        child: TextField(keyboardType: type,
            decoration: buildInputDecoration(hint)));
  }
}
