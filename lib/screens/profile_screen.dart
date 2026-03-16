import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPremium = true; // потом RevenueCat заменит на реальное

    String musicTime = '2 года 5 месяцев 12 дней 4 часа'; // алгоритм условного вывода

    return Scaffold(
      backgroundColor: const Color(0xFF2C0F0F),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            GlassmorphicContainer(
              width: 120, height: 120, borderRadius: 60, blur: 20,
              linearGradient: const LinearGradient(colors: [Color(0xFF006400), Colors.transparent]),
              child: const CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://i.pravatar.cc/150')), // потом твой аватар
            ),
            const SizedBox(height: 12),
            const Text('Иван Иванов', style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold)),
            const Text('@username', style: TextStyle(fontSize: 18, color: Colors.white70)),
            if (isPremium) const Icon(Icons.diamond, color: Colors.amber, size: 32),

            const SizedBox(height: 30),
            GlassmorphicContainer(
              width: double.infinity, height: 80, borderRadius: 20, blur: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Дата регистрации', style: TextStyle(color: Colors.white70)),
                  Text('15 марта 2024', style: const TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),

            const SizedBox(height: 16),
            GlassmorphicContainer(
              width: double.infinity, height: 80, borderRadius: 20, blur: 15,
              child: Center(child: Text('Время в музыке\n$musicTime', style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold))),
            ),

            const SizedBox(height: 30),
            const Text('Мои альбомы (только ты можешь создавать)', style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (c, i) => Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GlassmorphicContainer(
                    width: 140, height: 160, borderRadius: 20, blur: 15,
                    child: Column(children: [const Icon(Icons.album, size: 70, color: Colors.white), Text('Альбом ${i+1}')]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {}, // сюда потом алгоритм создания альбома №3
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF006400)),
              child: const Text('Создать новый альбом'),
            ),
          ],
        ),
      ),
    );
  }
}