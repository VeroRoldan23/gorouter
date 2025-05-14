import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AgeCalculatorScreen extends StatefulWidget {
  const AgeCalculatorScreen({super.key});

  @override
  State<AgeCalculatorScreen> createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  DateTime? birthDate;
  String? ageResult;

  void calculateAge() {
    if (birthDate != null) {
      final now = DateTime.now();
      int years = now.year - birthDate!.year;
      if (now.month < birthDate!.month ||
          (now.month == birthDate!.month && now.day < birthDate!.day)) {
        years--;
      }
      setState(() {
        ageResult = 'Tienes $years años';
      });
    }
  }

  Future<void> pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        birthDate = picked;
        ageResult = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Edad'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: pickDate,
                child: const Text('Selecciona tu fecha de nacimiento'),
              ),
              const SizedBox(height: 16),
              if (birthDate != null)
                Text('Fecha: ${DateFormat('dd/MM/yyyy').format(birthDate!)}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateAge,
                child: const Text('Calcular Edad'),
              ),
              const SizedBox(height: 16),
              if (ageResult != null)
                Text(ageResult!, style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
