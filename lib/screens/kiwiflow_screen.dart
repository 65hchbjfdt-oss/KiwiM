import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class KiwiFlowScreen extends StatefulWidget {
  const KiwiFlowScreen({super.key});
  @override
  State<KiwiFlowScreen> createState() => _KiwiFlowScreenState();
}

class _KiwiFlowScreenState extends State<KiwiFlowScreen> {
  Map<String, String> current = {'title': 'Ahoule Plateg', 'artist': 'Unknown'};
  Map<String, String> next1 = {'title': 'Next Wave', 'artist': 'Kiwi Vibes'};
  Map<String, String> next2 = {'title': 'Flow State', 'artist': 'Green Kiwi'};

  void _likeOrListen() {
    setState(() {
      current = next1;
      next1 = next2;
      next2 = {'title': 'Новый по твоим предпочтениям', 'artist': 'KiwiFlow'};
    });
  }

  void _regenerate() {
    setState(() {
      next1 = {'title': 'Пересобранный 1', 'artist': 'KiwiFlow'};
      next2 = {'title': 'Пересобранный 2', 'artist': 'KiwiFlow'};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0F0F),
      appBar: AppBar(title: const Text('KiwiFlow')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GlassmorphicContainer(
              width: double.infinity,
              height: 100,
              borderRadius: 20,
              blur: 20,
              child: Center(child: Text('Сейчас: ${current['title']}')),
            ),
            const SizedBox(height: 24),
            Text('Следующий: ${next1['title']}'),
            Text('Ещё один: ${next2['title']}'),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _likeOrListen, child: const Text('👍 Дослушал / Лайк')),
                ElevatedButton(onPressed: _regenerate, style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text('Не то, что хотел')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}