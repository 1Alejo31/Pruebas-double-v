import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
  final String labelTextString;
  final String hintTextString;
  final Icon icono;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? readOnlyStatus;
  final TextEditingController? fechaNacController;
  final Function(BuildContext)? selectDate;

  const CustomTextFormFild({
    super.key,
    required this.labelTextString,
    required this.hintTextString,
    required this.icono,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.readOnlyStatus = false,
    this.fechaNacController,
    this.selectDate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnlyStatus ?? false,
      controller: fechaNacController ?? null,
      onTap: selectDate != null ? () => selectDate!(context) : null,
      decoration: InputDecoration(
        labelText: labelTextString,
        hintText: hintTextString,
        errorText: errorMessage != null ? errorMessage : null,
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
