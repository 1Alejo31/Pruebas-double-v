import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String textoBoton;
  final Color colorBoton;
  final Color colorTexto;
  final Icon icono;
  final VoidCallback? onPressed;

  CustomButtom({
    required this.textoBoton,
    required this.colorBoton,
    required this.colorTexto,
    required this.icono,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorBoton,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono.icon, color: colorTexto),
            const SizedBox(width: 8),
            Text(
              '$textoBoton',
              style: TextStyle(color: colorTexto, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
