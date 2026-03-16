import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
// revenuecat_purchases_flutter подключишь потом

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0F0F),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Kiwi Premium', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),

            GlassmorphicContainer(
              width: double.infinity, height: 110, borderRadius: 25, blur: 20,
              child: const Center(child: Text('Ежемесячно\n97 ₽', style: TextStyle(fontSize: 26, color: Colors.white))),
            ),
            const SizedBox(height: 16),
            GlassmorphicContainer(
              width: double.infinity, height: 110, borderRadius: 25, blur: 20,
              child: const Center(child: Text('Ежегодно\n660 ₽ (55 ₽/мес)\nСкидка 43%', style: TextStyle(fontSize: 26, color: Colors.white))),
            ),

            const SizedBox(height: 40),
            const Text('Всё, что ты просил: скачивание, ремиксы, продвинутый KiwiFlow', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {}, // здесь RevenueCat.purchase
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF006400), padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18)),
              child: const Text('Подписаться', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}