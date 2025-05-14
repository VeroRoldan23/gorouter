
import 'package:go_router/go_router.dart';
import 'screens/home_screen.dart';
import 'screens/age_calculator_screen.dart';
import 'screens/calorie_calculator_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/age-calculator',
      builder: (context, state) => const AgeCalculatorScreen(),
    ),
    GoRoute(
      path: '/calorie-calculator',
      builder: (context, state) => const CalorieCalculatorScreen(),
    ),
   
  ],
);
