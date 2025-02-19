import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_double_v/presentation/screen/widgets/fondo.dart';
import 'package:prueba_double_v/presentation/screen/widgets/boton.dart';
import 'package:prueba_double_v/presentation/screen/widgets/imagenCentral.dart';

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
                const CustomFontLogin(),
                Column(
                  children: [
                    CustomImage(
                      src: 'assets/img/centralPro.png',
                      topData: 200,
                    ),
                    CustomImage(
                      src: 'assets/img/textoHome.png',
                      topData: 20,
                    ),
                    const SizedBox(height: 30),
                    CustomButtom(
                      textoBoton: 'Registrarse',
                      colorBoton: const Color.fromARGB(255, 94, 64, 113),
                      colorTexto: Colors.white,
                      icono: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
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
