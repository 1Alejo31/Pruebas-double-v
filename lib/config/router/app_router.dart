import 'package:go_router/go_router.dart';
import 'package:prueba_double_v/presentation/screen/screens.dart';

final appRoute = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/AppForm',
      name: 'AppForm',
      builder: (context, state) => const AppForm(),
    ),
    GoRoute(
      path: '/ShowData',
      name: 'ShowData',
      builder: (context, state) => const ShowData(),
    ),
  ],
);
