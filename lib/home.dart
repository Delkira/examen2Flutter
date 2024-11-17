import 'package:examen2_app/screens/base.dart';
import 'package:examen2_app/screens/currency.dart';
import 'package:examen2_app/screens/prime.dart';
import 'package:examen2_app/screens/them.dart';
import 'package:examen2_app/screens/theme_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const BaseConverterScreen(),
    const CurrencyConverterScreen(),
    const PrimeCheckerScreen(),
    const ThemeSettingsScreen(),
    const ThemeSwitchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examen segundo parcial'),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(235, 4, 148, 244),
        unselectedItemColor: const Color.fromARGB(237, 110, 194, 215),
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Base'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: 'Moneda'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Primo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.color_lens), label: 'Colores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_6), label: 'Tema'),
        ],
      ),
    );
  }
}
