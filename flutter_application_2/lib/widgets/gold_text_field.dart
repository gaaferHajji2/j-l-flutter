import 'package:flutter/material.dart';

class GoldTextField extends StatelessWidget {
  const GoldTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscure = false,
    this.keyboard = TextInputType.text,
    this.prefixIcon,
    required this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final TextInputType keyboard;
  final Widget? prefixIcon;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFBFA46F);
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: this.validator,
      keyboardType: keyboard,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.08),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: gold, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }
}
