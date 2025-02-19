import 'package:flutter/material.dart';
import 'package:prueba_double_v/presentation/screen/widgets/boton.dart';
import 'package:prueba_double_v/presentation/screen/widgets/fondo.dart';

class AppForm extends StatefulWidget {
  const AppForm({super.key});

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
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
                  CustomFont(
                    src: 'assets/img/fondo4.png',
                  ),
                  _formulario(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _formulario(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 200, left: 20, right: 20),
    child: Card(
      elevation: 9.0,
      color: Color.fromARGB(19, 125, 108, 164),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.topLeft,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 220, 220, 220),
                        Color.fromARGB(255, 157, 126, 231),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: const Center(
                    child: Text(
                      'Registro de información',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            _textFieldNombre(),
            const SizedBox(
              height: 10,
            ),
            _textFieldApellido(),
            const SizedBox(
              height: 10,
            ),
            _textFieldFechaNacimiento(),
            const SizedBox(
              height: 10,
            ),
            _textFieldFechaDireccion(),
            const SizedBox(height: 20),
            CustomButtom(
              textoBoton: 'Guardar',
              colorBoton: const Color.fromARGB(255, 94, 64, 113),
              colorTexto: Colors.white,
              icono: const Icon(Icons.save),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _textFieldNombre() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Nombre',
      hintText: 'Julian',
      border: const OutlineInputBorder(),
      prefixIcon:
          Icon(Icons.person, color: const Color.fromARGB(255, 125, 82, 243)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 200, 182, 248)),
      ),
    ),
  );
}

Widget _textFieldApellido() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Apellido',
      hintText: 'Gonzalez',
      border: const OutlineInputBorder(),
      prefixIcon:
          Icon(Icons.person, color: const Color.fromARGB(255, 125, 82, 243)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 200, 182, 248)),
      ),
    ),
  );
}

Widget _textFieldFechaNacimiento() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Fecha de nacimiento',
      hintText: '23/01/23',
      border: const OutlineInputBorder(),
      prefixIcon: Icon(Icons.date_range,
          color: const Color.fromARGB(255, 125, 82, 243)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 200, 182, 248)),
      ),
    ),
  );
}

Widget _textFieldFechaDireccion() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Dirección',
      hintText: 'Calle 42 b sur #3d este 61',
      border: const OutlineInputBorder(),
      prefixIcon: Icon(Icons.date_range,
          color: const Color.fromARGB(255, 125, 82, 243)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 200, 182, 248)),
      ),
    ),
  );
}
