import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? toggleObscure;

  const CustomTextField({
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.obscureText = false,
    this.toggleObscure,
    Key? key, String? errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 1),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        if (isPassword)
          IconButton(
            onPressed: toggleObscure,
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          ),
      ],
    );
  }
}
