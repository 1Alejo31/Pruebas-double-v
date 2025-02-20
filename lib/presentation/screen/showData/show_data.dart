import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_double_v/presentation/blocs/register/register_bloc.dart';
import 'package:prueba_double_v/presentation/screen/widgets/widgets.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key});

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
                  const CustomFont(
                    src: 'assets/img/fondo2.png',
                  ),
                  Column(
                    children: [
                      const CustomImage(
                        src: 'assets/img/centralPro.png',
                        topData: 120,
                      ),
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 0, left: 20, right: 20),
                        child: Card(
                          elevation: 9.0,
                          color: const Color.fromARGB(19, 146, 125, 193),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: BlocBuilder<RegisterBloc, RegisterFormState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Información del usuario',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Nombre: ${state.userName}",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Apellido: ${state.userLastName}",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Fecha Nacimiento: ${state.userDate}",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Dirección: ${state.userDirections.join(', ')}",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomButtom(
                                      textoBoton: "",
                                      colorBoton: const Color.fromARGB(0, 255, 255, 255),
                                      colorTexto: Colors.white,
                                      icono: const Icon(Icons.arrow_back),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
