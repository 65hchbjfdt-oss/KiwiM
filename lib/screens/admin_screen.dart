import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0F0F),
      appBar: AppBar(title: const Text('Admin — Реклама'), backgroundColor: Colors.transparent),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GlassmorphicContainer(
            width: double.infinity, height: 80, borderRadius: 20, blur: 15,
            child: const ListTile(title: Text('Баннер на главной'), trailing: Icon(Icons.add)),
          ),
          const SizedBox(height: 12),
          GlassmorphicContainer(
            width: double.infinity, height: 80, borderRadius: 20, blur: 15,
            child: const ListTile(title: Text('Реклама между треками'), trailing: Icon(Icons.add)),
          ),
          const SizedBox(height: 12),
          GlassmorphicContainer(
            width: double.infinity, height: 80, borderRadius: 20, blur: 15,
            child: const ListTile(title: Text('Реклама в плеере'), trailing: Icon(Icons.add)),
          ),
          const SizedBox(height: 30),
          const Text('Здесь ты будешь размещать рекламу — она появится в приложении', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}