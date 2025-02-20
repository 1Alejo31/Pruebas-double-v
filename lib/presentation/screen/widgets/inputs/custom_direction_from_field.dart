import 'package:flutter/material.dart';

class CustomDirectionFormFild extends StatelessWidget {
  final String labelTextString;
  final String hintTextString;
  final Icon icono;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool readOnlyStatus;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const CustomDirectionFormFild({
    super.key,
    required this.labelTextString,
    required this.hintTextString,
    required this.icono,
    this.onChanged,
    this.validator,
    this.readOnlyStatus = false,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnlyStatus,
      controller: controller,
      onTap: onTap,
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
