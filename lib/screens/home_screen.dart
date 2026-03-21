import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0F0F),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text('Привет, Иван!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text('Мы приготовили кое-что для тебя', style: TextStyle(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 30),
            GlassmorphicContainer(
              width: double.infinity,
              height: 120,
              borderRadius: 25,
              blur: 25,
              linearGradient: const LinearGradient(colors: [Color(0xFF006400), Color(0xFF2C0F0F)]),
              child: const Center(child: Text('KiwiFlow Premium\n∞ бесконечный поток', style: TextStyle(fontSize: 22, color: Colors.white))),
            ),
            const SizedBox(height: 30),
            const Text('Популярно в России 🇷🇺', style: TextStyle(fontSize: 20, color: Colors.white)),
            ...List.generate(5, (i) => ListTile(title: Text('Трек ${i+1}'), subtitle: Text('${1247 + i * 300} прослушиваний'), textColor: Colors.white)),
          ],
        ),
      ),
    );
  }
}