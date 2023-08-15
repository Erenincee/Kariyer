import 'package:flutter/material.dart';

class EmailMyTextField extends StatelessWidget {
  final controller;
  final String? hintText;
  final bool obscureText;

  EmailMyTextField({
    super.key,
    this.controller,
    this.hintText,
    required this.obscureText,
  });
  final _formKey = GlobalKey<FormState>();
  final String _email = '';

  String? validateEmail(value) {
    if (!value.contains('@')) {
      return 'Geçerli bir e-posta adresi giriniz.';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Form gönderimi veya diğer işlemler burada yapılabilir
      print('Gönderilen e-posta: $_email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        validator: validateEmail,
        controller: controller,
        inputFormatters: const [],
        maxLines: null,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: const Icon(Icons.mail),
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
