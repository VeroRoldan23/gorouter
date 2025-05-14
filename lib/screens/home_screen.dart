import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadoras')), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/age-calculator'),
              child: const Text('Calculadora de Edad'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/calorie-calculator'),
              child: const Text('Calculadora de Calorías'),
            ),
          ],
        ),
      ),
    );
  }
}
