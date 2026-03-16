import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class KiwiFlowScreen extends StatefulWidget {
  const KiwiFlowScreen({super.key});
  @override
  State<KiwiFlowScreen> createState() => _KiwiFlowScreenState();
}

class _KiwiFlowScreenState extends State<KiwiFlowScreen> {
  final List<Map<String, String>> _tracks = [
    {'title': 'Ahoule Plateg', 'artist': 'Unknown Artist', 'style': 'Rock'},
    {'title': 'Next Wave', 'artist': 'Kiwi Vibes', 'style': 'Electronic'},
  ];

  Map<String, String> currentTrack = {'title': 'Ahoule Plateg', 'artist': 'Unknown Artist'};
  Map<String, String> next1 = {'title': 'Next Wave', 'artist': 'Kiwi Vibes'};
  Map<String, String> next2 = {'title': 'Flow State', 'artist': 'Green Kiwi'};

  bool isPremium = true; // потом подключишь RevenueCat

  void _likeOrComplete() {
    setState(() {
      currentTrack = next1;
      next1 = next2;
      next2 = {'title': 'New track based on your like', 'artist': 'Algorithm'};
    });
  }

  void _regenerate() {
    setState(() {
      next1 = {'title': 'Regenerated 1', 'artist': 'KiwiFlow'};
      next2 = {'title': 'Regenerated 2', 'artist': 'KiwiFlow'};
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Волна пересобрана!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0F0F),
      appBar: AppBar(title: const Text('KiwiFlow'), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          GlassmorphicContainer(
            width: double.infinity, height: 80, borderRadius: 0, blur: 20,
            child: Text('Текущий: ${currentTrack['title']}', style: const TextStyle(fontSize: 24, color: Colors.white)),
          ),
          const Text('Следующий (в буфере): ${next1['title']}'),
          const Text('Ещё один: ${next2['title']}'),

          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _likeOrComplete, child: const Text('👍 Лайк / Дослушал')),
              ElevatedButton(onPressed: _regenerate, style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text('Не то, что хотел')),
            ],
          ),

          if (isPremium)
            const Text('Премиум: алгоритм обучается + 2 трека вперёд', style: TextStyle(color: Color(0xFF006400))),
        ],
      ),
    );
  }
}