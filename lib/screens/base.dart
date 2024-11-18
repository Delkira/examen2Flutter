import 'package:examen2_app/providers/base_converter.dart';
import 'package:examen2_app/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseConverterScreen extends StatelessWidget {
  const BaseConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final baseConverter = Provider.of<BaseConverterProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/daki.webp'),
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
                  labelText: 'Ingrese un número',
                  labelStyle: TextStyle(color: themeProvider.primaryColor),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themeProvider.primaryColor),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: baseConverter.setInput,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              DropdownButton<int>(
                value: baseConverter.base,
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    baseConverter.setBase(newValue);
                  }
                },
                items: [
                  DropdownMenuItem(
                      value: 2,
                      child: Text(
                        'Binario',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: themeProvider.primaryColor),
                      )),
                  DropdownMenuItem(
                      value: 8,
                      child: Text(
                        'Octal',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: themeProvider.primaryColor),
                      )),
                  DropdownMenuItem(
                      value: 16,
                      child: Text(
                        'Hexadecimal',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: themeProvider.primaryColor),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Resultado: ${baseConverter.result}',
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
