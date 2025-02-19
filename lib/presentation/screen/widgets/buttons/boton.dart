import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String textoBoton;
  final Color colorBoton;
  final Color colorTexto;
  final Icon icono;
  final VoidCallback? onPressed;

  const CustomButtom({
    super.key,
    required this.textoBoton,
    required this.colorBoton,
    required this.colorTexto,
    required this.icono,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorBoton),
        foregroundColor: MaterialStateProperty.all<Color>(colorTexto),
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono.icon, color: colorTexto),
          if (textoBoton != '') const SizedBox(width: 8),
          Text(
            textoBoton,
            style: TextStyle(color: colorTexto, fontSize: 20),
          )
        ],
      ),
    );
  }
}
