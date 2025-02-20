import 'package:flutter/material.dart';

class CustomDirectionFormFild extends StatelessWidget {
  final String labelTextString;
  final String hintTextString;
  final Icon icono;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomDirectionFormFild({
    super.key,
    required this.labelTextString,
    required this.hintTextString,
    required this.icono,
    required this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelTextString,
        hintText: hintTextString,
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
