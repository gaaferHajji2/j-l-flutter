import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:complaint_app/utils/show_toast.dart';
import 'package:complaint_app/utils/validate.dart';
import 'package:complaint_app/widgets/gold_btn.dart';
import 'package:complaint_app/widgets/gold_logo.dart';
import 'package:complaint_app/widgets/gold_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailCtrl.text.trim(),
      password: _passCtrl.text,
    );

    final user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      if (mounted) {
        showToast(
          context: context,
          title: "Verify your email first",
          msg: "Please verify your email. Verification link sent.",
          type: ContentType.warning,
        );
      }
      await FirebaseAuth.instance.signOut();
    } else {
      if (mounted) {
        showToast(
          context: context,
          title: "Email verified",
          msg: "Your email has been verified",
        );
      }
    }
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            children: [
              const EagleLogo(size: 140),
              const SizedBox(height: 40),

              // Email
              GoldTextField(
                controller: _emailCtrl,
                hint: 'Email',
                validator: Validate.validateEmail,
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Password
              GoldTextField(
                controller: _passCtrl,
                hint: 'Password',
                validator: Validate.validatePassword,
                obscure: true,
              ),
              const SizedBox(height: 28),

              // Login button
              GoldButton(label: 'Login', onTap: _login),
              const SizedBox(height: 20),

              // Sign-up link
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Color(0xFFBFA46F)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
