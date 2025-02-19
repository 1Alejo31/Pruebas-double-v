import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
  final String labelTextString;
  final String hintTextString;
  final Icon icono;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormFild({
    super.key,
    required this.labelTextString,
    required this.hintTextString,
    required this.icono,
    required this.errorMessage,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelTextString,
        hintText: hintTextString,
        errorText: errorMessage,
        border: const OutlineInputBorder(),
        prefixIcon: icono,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 200, 182, 248),
          ),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
