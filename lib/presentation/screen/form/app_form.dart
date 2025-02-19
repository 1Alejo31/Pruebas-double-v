import 'package:flutter/material.dart';
import 'package:prueba_double_v/presentation/screen/widgets/widgets.dart';

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
                  const CustomFont(src: 'assets/img/fondo4.png'),
                  _formulario(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _formulario() {
  return Container(
    margin: const EdgeInsets.only(top: 130, left: 20, right: 20),
    child: Card(
      elevation: 9.0,
      color: Color.fromARGB(19, 146, 125, 193),
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
            const SizedBox(height: 40),
            RegisterForm(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          CustomTextFormFild(
            labelTextString: "Nombre",
            hintTextString: "Ingresa el nombre",
            icono: Icon(
              Icons.person,
              color: Color.fromARGB(255, 85, 168, 236),
            ),
            errorMessage: "Hay un error",
          ),
          SizedBox(height: 10),
          CustomTextFormFild(
            labelTextString: "Apellido",
            hintTextString: "Ingresa el apellido",
            icono: Icon(
              Icons.supervised_user_circle_outlined,
              color: Color.fromARGB(255, 85, 168, 236),
            ),
            errorMessage: "Hay un error",
          ),
          SizedBox(height: 10),
          CustomTextFormFild(
            labelTextString: "Fecha de nacimiento",
            hintTextString: "",
            icono: Icon(
              Icons.date_range_rounded,
              color: Color.fromARGB(255, 85, 168, 236),
            ),
            errorMessage: "Hay un error",
          ),
          SizedBox(height: 10),
          CustomTextFormFild(
            labelTextString: "Dirección",
            hintTextString: "Infrese la dirección",
            icono: Icon(
              Icons.location_on_outlined,
              color: Color.fromARGB(255, 85, 168, 236),
            ),
            errorMessage: "Hay un error",
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtom(
                textoBoton: "",
                colorBoton: Color.fromARGB(255, 76, 174, 255),
                colorTexto: Colors.white,
                icono: Icon(Icons.add_location_alt_outlined),
              ),
              SizedBox(
                width: 10,
              ),
              CustomButtom(
                textoBoton: "Guardar",
                colorBoton: Color.fromARGB(255, 94, 64, 113),
                colorTexto: Colors.white,
                icono: Icon(Icons.save),
              )
            ],
          ),
        ],
      ),
    );
  }
}
