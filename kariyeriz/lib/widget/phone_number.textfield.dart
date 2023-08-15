import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneMyTextField extends StatelessWidget {
  final controller;
  final String? hintText;
  final bool obscureText;

  PhoneMyTextField({
    super.key,
    this.controller,
    this.hintText,
    required this.obscureText,
  });
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final phoneNumberController = TextEditingController();
    final phoneNumberFocusNode = FocusNode();

    @override
    void dispose() {
      phoneNumberController.dispose();
      phoneNumberFocusNode.dispose();
    }

    bool _isNumeric(String value) {
      if (value == null) {
        return false;
      }
      return double.tryParse(value) != null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please enter a phone number.';
          } else if (value.replaceAll(' ', '').length != 11) {
            return 'Telefon numarası tam olarak 11 karakter olmalıdır.';
          } else if (value[0] != '0') {
            return 'Telefon numarası 0 ile başlamalıdır.';
          } else if (_isNumeric(value.substring(1))) {
            return 'Geçersiz telefon numarası biçimi.';
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.number,
        maxLines: null,
        obscureText: obscureText,
        inputFormatters: [
          LengthLimitingTextInputFormatter(14), // En fazla 14 karakter
          FilteringTextInputFormatter.digitsOnly, // Sadece sayıları kabul eder
          _PhoneNumberFormatter(), // Telefon numarası formatını sağlar
        ],
        decoration: InputDecoration(
          icon: const Icon(Icons.phone),
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

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newText.length <= 4) {
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    } else if (newText.length <= 7) {
      final formattedText =
          '${newText.substring(0, 4)} ${newText.substring(4)}';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    } else if (newText.length <= 10) {
      final formattedText =
          '${newText.substring(0, 4)} ${newText.substring(4, 7)} ${newText.substring(7)}';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    } else {
      final formattedText =
          '${newText.substring(0, 4)} ${newText.substring(4, 7)} ${newText.substring(7, 9)} ${newText.substring(9)}';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }
}
