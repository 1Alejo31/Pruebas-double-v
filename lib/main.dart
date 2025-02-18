import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_double_v/config/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Prueba Double v',
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: appRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
