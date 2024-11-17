import 'package:examen2_app/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personalizar colores"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Elige un color primario",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ColorPicker(
              onColorSelected: (color) {
                themeProvider.setPrimaryColor(color);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  final ValueChanged<Color> onColorSelected;

  const ColorPicker({required this.onColorSelected, super.key});

  @override
  Widget build(BuildContext context) {
    // Define una lista de colores disponibles
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.yellow,
      Colors.black,
      Colors.purple,
      Colors.pink,
    ];

    return Wrap(
      spacing: 10,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () => onColorSelected(color),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 1),
            ),
          ),
        );
      }).toList(),
    );
  }
}
