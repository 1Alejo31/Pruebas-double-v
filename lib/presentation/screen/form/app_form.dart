import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_double_v/presentation/blocs/register/register_bloc.dart';
import 'package:prueba_double_v/presentation/screen/widgets/widgets.dart';

class AppForm extends StatelessWidget {
  const AppForm({super.key});

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
                      colorBoton: const Color.fromARGB(0, 255, 255, 255),
                      colorTexto: Colors.white,
                      icono: const Icon(Icons.arrow_back),
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
    child: const Card(
      elevation: 9.0,
      color: Color.fromARGB(19, 146, 125, 193),
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Registro de información',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40),
            RegisterForm(),
            SizedBox(height: 10),
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
  final TextEditingController fechaNacController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final ConfettiController _controllerTopCenter =
      ConfettiController(duration: const Duration(seconds: 1));

  List<TextEditingController> direccionControllers = [];

  @override
  void initState() {
    super.initState();
    _agregarDireccion();
    _controllerTopCenter.addListener(() {
      if (_controllerTopCenter.state == ConfettiControllerState.stopped) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  void _agregarDireccion() {
    setState(() {
      final controller = TextEditingController();
      direccionControllers.add(controller);
      _actualizarDireccionesEnBloc();
    });
  }

  void _eliminarDireccion(int index) {
    setState(() {
      direccionControllers.removeAt(index);
      _actualizarDireccionesEnBloc();
    });
  }

  void _actualizarDireccionesEnBloc() {
    final registerBloc = context.read<RegisterBloc>();
    List<String> direcciones = direccionControllers.map((c) => c.text).toList();
    registerBloc.add(UserDirectionChanged(direcciones));
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        fechaNacController.text = "${picked.toLocal()}".split(' ')[0];
      });

      context
          .read<RegisterBloc>()
          .add(UserDateChanged(fechaNacController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.watch<RegisterBloc>();

    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormFild(
            labelTextString: "Nombre",
            hintTextString: "Ingresa el nombre",
            icono: const Icon(Icons.person,
                color: Color.fromARGB(255, 85, 168, 236)),
            onChanged: (value) {
              registerBloc.add(UserNameChanged(value));
              _formkey.currentState?.validate();
            },
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
            icono: const Icon(Icons.supervised_user_circle_outlined,
                color: Color.fromARGB(255, 85, 168, 236)),
            onChanged: (value) {
              registerBloc.add(UserLastNameChanged(value));
              _formkey.currentState?.validate();
            },
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
            hintTextString: "Selecciona tu fecha",
            icono: const Icon(Icons.date_range_rounded,
                color: Color.fromARGB(255, 85, 168, 236)),
            readOnlyStatus: true,
            fechaNacController: fechaNacController,
            selectDate: selectDate,
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(direccionControllers.length, (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomDirectionFormFild(
                          labelTextString: "Dirección ${index + 1}",
                          hintTextString: "Ingrese la dirección",
                          icono: const Icon(Icons.location_on_outlined,
                              color: Color.fromARGB(255, 85, 168, 236)),
                          controller: direccionControllers[index],
                          onChanged: (value) => _actualizarDireccionesEnBloc(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo requerido';
                            }
                            return null;
                          },
                        ),
                      ),
                      if (direccionControllers.length > 1)
                        IconButton(
                          icon: const Icon(Icons.delete_forever_outlined,
                              color: Colors.red),
                          onPressed: () => _eliminarDireccion(index),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtom(
                textoBoton: "",
                colorBoton: const Color.fromARGB(255, 76, 174, 255),
                colorTexto: Colors.white,
                icono: const Icon(Icons.add_location_alt_outlined),
                onPressed: _agregarDireccion,
              ),
              const SizedBox(width: 10),
              CustomButtom(
                textoBoton: "Guardar",
                colorBoton: const Color.fromARGB(255, 94, 64, 113),
                colorTexto: Colors.white,
                icono: const Icon(Icons.save),
                onPressed: () {
                  final isValid = _formkey.currentState!.validate();
                  if (!isValid) return;
                  _controllerTopCenter.play();
                  registerBloc.add(FormSubmitted());
                },
              ),
            ],
          ),
          ConfettiWidget(
            confettiController: _controllerTopCenter,
            blastDirection: -3.14 / 2,
            maxBlastForce: 5,
            minBlastForce: 2,
            emissionFrequency: 0.05,
            numberOfParticles: 20,
            gravity: 0.1,
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: registerBloc.state.statusData,
            child: CustomButtom(
              textoBoton: 'Ver Registro',
              colorBoton: const Color.fromARGB(255, 94, 64, 113),
              colorTexto: Colors.white,
              icono: const Icon(Icons.navigate_next),
              onPressed: () {
                context.push('/ShowData');
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
