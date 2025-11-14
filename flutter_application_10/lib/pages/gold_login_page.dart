import 'package:complaint_app/widgets/gold_btn.dart';
import 'package:complaint_app/widgets/gold_logo.dart';
import 'package:complaint_app/widgets/gold_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _login() {
    // TODO: real authentication
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login pressed – implement auth')),
    );
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
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Password
              GoldTextField(
                controller: _passCtrl,
                hint: 'Password',
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
