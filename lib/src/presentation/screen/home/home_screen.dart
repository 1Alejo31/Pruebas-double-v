import 'package:flutter/cupertino.dart';
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
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

_fondoLogin() {
  return ClipRect(
    child: Image.asset(
      fit: BoxFit.cover,
      'assets/img/fondo2.png',
    ),
  );
}
