import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function(String value) onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;

  const AppTextField({
    super.key,
    required this.text,
    required this.icon,
    required this.onChanged,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged(value),
      obscureText: isPassword,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: Text(text),
          prefixIcon: Icon(
            icon,
            color: Colors.grey[800],
            size: 22,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          )),
      validator: validator,
    );
  }
}
