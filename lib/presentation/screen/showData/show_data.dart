import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_double_v/presentation/screen/widgets/widgets.dart';

class ShowData extends ConsumerStatefulWidget {
  const ShowData({super.key});

  @override
  ConsumerState<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends ConsumerState<ShowData> {
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
                      margin:
                          const EdgeInsets.only(top: 0, left: 20, right: 20),
                      child: Card(
                        elevation: 9.0,
                        color: Color.fromARGB(19, 146, 125, 193),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Column(
                            children: [
                              Align(
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
                              SizedBox(height: 40),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Nombre: ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Apellido: ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Fecha Nacimiento : ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Dirección: ",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              CustomButtom(
                                textoBoton: "",
                                colorBoton: Color.fromARGB(0, 255, 255, 255),
                                colorTexto: Colors.white,
                                icono: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
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
    ));
  }
}
