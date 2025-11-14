import 'package:complaint_app/utils/validate.dart';
import 'package:complaint_app/widgets/gold_btn.dart';
import 'package:complaint_app/widgets/gold_logo.dart';
import 'package:complaint_app/widgets/gold_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _signup() {
    if (_formKey.currentState!.validate()) {
      // TODO: Call your API / Firebase / Auth service
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-up successful! (Demo)')),
      );
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter email';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Enter password';
    if (value.length < 6) return 'Password too short';
    return null;
  }

  String? _validateConfirm(String? value) {
    if (value != _passCtrl.text) return 'Passwords do not match';
    return null;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const EagleLogo(size: 140),
                const SizedBox(height: 32),
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),

                // Full Name
                GoldTextField(
                  controller: _nameCtrl,
                  hint: 'Full Name',
                  validator: Validate.validateName,
                  prefixIcon: const Icon(Icons.person_outline),
                  keyboard: TextInputType.name,
                ),
                const SizedBox(height: 16),

                // Email
                GoldTextField(
                  controller: _emailCtrl,
                  hint: 'Email',
                  validator: Validate.validateEmail,
                  keyboard: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 16),

                // Password
                GoldTextField(
                  controller: _passCtrl,
                  hint: 'Password',
                  validator: Validate.validatePassword,
                  obscure: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 16),

                // Confirm Password
                GoldTextField(
                  controller: _confirmCtrl,
                  hint: 'Confirm Password',
                  validator: (txt) => Validate.validateConfirm(txt, _passCtrl),
                  obscure: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 28),

                // Sign Up Button
                GoldButton(label: 'Sign Up', onTap: _signup),
                const SizedBox(height: 20),

                // Login Link
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Color(0xFFBFA46F)),
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
