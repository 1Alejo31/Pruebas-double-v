import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Stack(
              children: [
                _fondoLogin(),
                Column(
                  children: [
                    _imagenCentral(),
                    _imagenTexto(),
                    const SizedBox(height: 30),
                    _boton(
                      context,
                      "Regitrarse",
                      const Color.fromARGB(255, 94, 64, 113),
                      Colors.white,
                      Icons.add,
                    ),
                    const SizedBox(height: 10),
                    _boton(
                      context,
                      "ver listado",
                      const Color.fromARGB(237, 81, 20, 64),
                      Colors.white,
                      Icons.list,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

Widget _fondoLogin() {
  return ClipRect(
    child: Image.asset(
      fit: BoxFit.cover,
      'assets/img/fondo2.png',
    ),
  );
}

Widget _imagenCentral() {
  return Padding(
    padding: const EdgeInsets.only(top: 200),
    child: Image.asset(
      'assets/img/centralPro.png',
    ),
  );
}

Widget _imagenTexto() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Image.asset(
      'assets/img/textoHome.png',
    ),
  );
}

Widget _boton(BuildContext context, textoBoton, colorBoton, colorTexto, icono) {
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
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, color: colorTexto),
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
