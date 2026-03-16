import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:path_provider/path_provider.dart'; // для кэша

class PlayerScreen extends StatefulWidget {
  final Map<String, String>? track;
  const PlayerScreen({super.key, this.track});
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool isPremium = true;
  bool isDownloaded = false;

  void _downloadEncrypted() async {
    if (!isPremium) return;
    final dir = await getApplicationDocumentsDirectory();
    final key = encrypt.Key.fromUtf8('32символа_для_шифрования_1234567890');
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    // здесь просто имитация — в реальности берёшь поток и шифруешь
    setState(() => isDownloaded = true);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Трек зашифрован и сохранён в кэше (нельзя вытащить)')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0F0F),
      body: Column(
        children: [
          const SizedBox(height: 80),
          GlassmorphicContainer(
            width: 280, height: 280, borderRadius: 40, blur: 30,
            child: const Icon(Icons.music_note, size: 180, color: Colors.white),
          ),
          const SizedBox(height: 30),
          const Text('Ahoule Plateg', style: TextStyle(fontSize: 28, color: Colors.white)),
          const Text('Unknown Artist', style: TextStyle(color: Colors.white70)),

          const SizedBox(height: 40),
          if (isPremium)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), child: const Text('Sped Up')),
                const SizedBox(width: 12),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), child: const Text('Slow ремикс')),
              ],
            ),

          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: _downloadEncrypted,
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF006400)),
            child: Text(isDownloaded ? '✅ Уже в кэше' : 'Скачать (только премиум)'),
          ),
        ],
      ),
    );
  }
}