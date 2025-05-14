import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalorieCalculatorScreen extends StatefulWidget {
  const CalorieCalculatorScreen({super.key});

  @override
  State<CalorieCalculatorScreen> createState() =>
      _CalorieCalculatorScreenState();
}

class _CalorieCalculatorScreenState extends State<CalorieCalculatorScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String gender = 'male';
  String? result;

  void calculateCalories() {
    final double? weight = double.tryParse(weightController.text);
    final double? height = double.tryParse(heightController.text);
    final int? age = int.tryParse(ageController.text);

    if (weight == null || height == null || age == null) {
      setState(() {
        result = 'Por favor ingresa todos los valores correctamente';
      });
      return;
    }

    double bmr;
    if (gender == 'male') {
      bmr = 66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
    } else {
      bmr = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
    }

    setState(() {
      result = 'Tu metabolismo basal es: ${bmr.toStringAsFixed(2)} calorías/día';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Calorías'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: weightController,
                decoration: const InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Altura (cm)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Edad (años)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: gender,
                items: const [
                  DropdownMenuItem(value: 'male', child: Text('Hombre')),
                  DropdownMenuItem(value: 'female', child: Text('Mujer')),
                ],
                onChanged: (value) => setState(() => gender = value!),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateCalories,
                child: const Text('Calcular Calorías'),
              ),
              const SizedBox(height: 16),
              if (result != null)
                Text(result!, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
