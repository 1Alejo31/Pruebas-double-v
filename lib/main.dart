import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_double_v/config/router/app_router.dart';
import 'package:prueba_double_v/config/theme/app_theme.dart';
import 'package:prueba_double_v/presentation/blocs/register/register_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ProviderScope(
    child: BlocProvider(
      create: (context) => RegisterBloc(),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      themeMode: ThemeMode.dark,
      routerConfig: appRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
