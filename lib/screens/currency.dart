import 'package:examen2_app/providers/currency_converter.dart';
import 'package:examen2_app/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyConverterScreen extends StatelessWidget {
  const CurrencyConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyConverter = Provider.of<CurrencyConverterProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/shinobu.jpg'),
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
                  labelText: 'Monto',
                  labelStyle: TextStyle(color: themeProvider.primaryColor),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themeProvider.primaryColor),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: currencyConverter.setInput,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(currencyConverter.isToDollars
                      ? 'BOB -> USD'
                      : 'USD -> BOB'),
                  Switch(
                    value: currencyConverter.isToDollars,
                    onChanged: (_) => currencyConverter.toggleConversion(),
                    activeColor: themeProvider.primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Resultado: ${currencyConverter.result}',
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
