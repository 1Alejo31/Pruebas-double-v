import 'package:go_router/go_router.dart';
import 'package:prueba_double_v/src/presentation/screen/home/home_screen.dart';

final appRoute = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
