import 'package:flutter/material.dart';

class AydinlatmaTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final Widget? icon;

  const AydinlatmaTextField(
      {super.key, this.hintText, required this.obscureText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        inputFormatters: const [],
        maxLines: null,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: icon,
          labelText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
