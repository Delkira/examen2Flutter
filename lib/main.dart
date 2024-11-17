import 'package:examen2_app/providers/base_converter.dart';
import 'package:examen2_app/providers/currency_converter.dart';
import 'package:examen2_app/providers/prime_checker.dart';
import 'package:examen2_app/providers/theme.dart';
import 'package:examen2_app/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BaseConverterProvider()),
        ChangeNotifierProvider(create: (_) => CurrencyConverterProvider()),
        ChangeNotifierProvider(create: (_) => PrimeCheckerProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Felix',
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const HomePage(),
    );
  }
}
