import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
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
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(widget.colorBoton),
        foregroundColor: MaterialStateProperty.all<Color>(widget.colorTexto),
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
          Icon(widget.icono.icon, color: widget.colorTexto),
          if (widget.textoBoton != '') const SizedBox(width: 8),
          Text(
            widget.textoBoton,
            style: TextStyle(color: widget.colorTexto, fontSize: 20),
          )
        ],
      ),
    );
  }
}
