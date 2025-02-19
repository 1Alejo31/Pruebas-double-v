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
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CustomButtom(
                      textoBoton: "",
                      colorBoton: Color.fromARGB(0, 255, 255, 255),
                      colorTexto: Colors.white,
                      icono: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
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

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String userName = '';
  String userLastName = '';
  String userDate = '';
  String userDirection = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormFild(
            labelTextString: "Nombre",
            hintTextString: "Ingresa el nombre",
            icono: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 85, 168, 236),
            ),
            onChanged: (value) => userName = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 3) return 'Más de 4 letras';
              if (value.length > 15) return 'Menos de 15 letras';
              if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                return 'Solo se permiten letras sin espacios';
              }

              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormFild(
            labelTextString: "Apellido",
            hintTextString: "Ingresa el apellido",
            icono: const Icon(
              Icons.supervised_user_circle_outlined,
              color: Color.fromARGB(255, 85, 168, 236),
            ),
            onChanged: (value) => userLastName = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 3) return 'Más de 5 letras';
              if (value.length > 15) return 'Menos de 15 letras';
              if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                return 'Solo se permiten letras sin espacios';
              }

              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormFild(
            labelTextString: "Fecha de nacimiento",
            hintTextString: "",
            icono: const Icon(
              Icons.date_range_rounded,
              color: Color.fromARGB(255, 85, 168, 236),
            ),
            onChanged: (value) => userDate = value,
          ),
          const SizedBox(height: 10),
          CustomTextFormFild(
            labelTextString: "Dirección",
            hintTextString: "Infrese la dirección",
            icono: const Icon(
              Icons.location_on_outlined,
              color: Color.fromARGB(255, 85, 168, 236),
            ),
            onChanged: (value) => userDirection = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 3) return 'Más de 5 letras';
              if (value.length > 15) return 'Menos de 15 letras';

              return null;
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomButtom(
                textoBoton: "",
                colorBoton: Color.fromARGB(255, 76, 174, 255),
                colorTexto: Colors.white,
                icono: Icon(Icons.add_location_alt_outlined),
              ),
              const SizedBox(
                width: 10,
              ),
              CustomButtom(
                textoBoton: "Guardar",
                colorBoton: const Color.fromARGB(255, 94, 64, 113),
                colorTexto: Colors.white,
                icono: const Icon(Icons.save),
                onPressed: () {
                  final isValid = _formkey.currentState!.validate();
                  if (!isValid) return;
                  print('$userName, $userLastName, $userDate, $userDirection');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
