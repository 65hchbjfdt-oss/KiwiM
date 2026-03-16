import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0F0F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  const Text('Привет, Иван!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                  const Spacer(),
                  GlassmorphicContainer(
                    width: 50, height: 50, borderRadius: 25, blur: 20,
                    linearGradient: const LinearGradient(colors: [Color(0xFF006400), Colors.transparent]),
                    child: const Icon(Icons.notifications, color: Colors.white),
                  ),
                ],
              ),
              const Text('Мы приготовили кое-что для тебя', style: TextStyle(fontSize: 18, color: Colors.white70)),

              const SizedBox(height: 30),
              const Text('Любимые исполнители', style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GlassmorphicContainer(
                      width: 140, height: 180, borderRadius: 20, blur: 15,
                      linearGradient: LinearGradient(colors: [Colors.black.withOpacity(0.4), const Color(0xFF006400).withOpacity(0.2)]),
                      child: Column(children: [const FlutterLogo(size: 80), Text('Track ${i+1}', style: const TextStyle(color: Colors.white))]),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text('Любимый стиль: Rock', style: TextStyle(fontSize: 20, color: Colors.white)),
              // такой же горизонтальный список как выше (скопируй и поменяй заголовок)

              const SizedBox(height: 30),
              GlassmorphicContainer(
                width: double.infinity, height: 120, borderRadius: 25, blur: 25,
                linearGradient: const LinearGradient(colors: [Color(0xFF006400), Color(0xFF2C0F0F)]),
                child: const Center(child: Text('KiwiFlow Premium\n∞ бесконечный поток', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold))),
              ),

              const SizedBox(height: 30),
              const Text('Популярно в России 🇷🇺', style: TextStyle(fontSize: 20, color: Colors.white)),
              // здесь 5 треков с анимированными счётчиками (используй AnimatedBuilder в реальной версии, пока просто текст)
              ...List.generate(5, (i) => ListTile(title: Text('Трек ${i+1}'), subtitle: Text('${1247 + i * 300} прослушиваний сегодня'))),
            ],
          ),
        ),
      ),
    );
  }
}