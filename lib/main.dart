import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  get appRouter => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    throw MaterialApp.router(
      title: 'Prueba Double v',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
