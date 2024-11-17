import 'package:examen2_app/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitchScreen extends StatelessWidget {
  const ThemeSwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Center(
      child: SwitchListTile(
        title: const Text('Modo Oscuro'),
        value: themeProvider.isDarkMode,
        onChanged: (_) => themeProvider.toggleTheme(),
      ),
    );
  }
}
