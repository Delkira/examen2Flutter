import 'package:examen2_app/providers/prime_checker.dart';
import 'package:examen2_app/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrimeCheckerScreen extends StatelessWidget {
  const PrimeCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primeChecker = Provider.of<PrimeCheckerProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hinata.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ingrese un numero',
                  labelStyle: TextStyle(color: themeProvider.primaryColor),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themeProvider.primaryColor),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: primeChecker.setInput,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                'Resultado: ${primeChecker.result}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
