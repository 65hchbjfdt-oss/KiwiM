import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'screens/home_screen.dart';
import 'screens/kiwiflow_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/player_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KiwiMusicApp());
}

class KiwiMusicApp extends StatelessWidget {
  const KiwiMusicApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KiwiMusic',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF2C0F0F),
        primaryColor: const Color(0xFF006400),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const KiwiFlowScreen(),
    const ProfileScreen(),
    const PlayerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: GlassmorphicContainer(
        width: double.infinity,
        height: 70,
        borderRadius: 30,
        blur: 20,
        linearGradient: LinearGradient(
          colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.3)],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xFF006400),
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(icon: Icon(Icons.waves), label: 'KiwiFlow'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
            BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Плеер'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF006400),
        onPressed: () {
          // Сюда можно добавить переход на подписку или админку
          Navigator.push(context, MaterialPageRoute(builder: (_) => const SubscriptionScreen())); // временно, потом уберёшь
        },
        child: const Icon(Icons.star),
      ),
    );
  }
}