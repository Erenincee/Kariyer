import 'package:flutter/material.dart';

class AdversiteMyTextField extends StatelessWidget {
  final controller;
  final String? hintText;
  final bool obscureText;
  final Widget? icon;
  const AdversiteMyTextField(
      {super.key,
      this.controller,
      this.hintText,
      required this.obscureText,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || value == "") {
            return "Lütfen Boş Bırakmayın";
          } else {
            return null;
          }
        },
        controller: controller,
        inputFormatters: const [],
        maxLines: null,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: hintText,
          icon: icon,
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
