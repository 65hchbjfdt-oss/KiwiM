import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/home_screen.dart';
import 'screens/kiwiflow_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/player_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация Supabase (одинаково для web и мобильного)
  await Supabase.initialize(
    url: 'https://kswsvpnhnowvvakgfkjz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imtzd3N2cG5obm93dnZha2dma2p6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM2NjY0NzYsImV4cCI6MjA4OTI0MjQ3Nn0.kCWcvUPJAw0q-pJPyD6gbiuP-ocWGhtvJvUPiY1mEX0',
  );

  runApp(const KiwiMusicApp());
}

class KiwiMusicApp extends StatelessWidget {
  const KiwiMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KiwiMusic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF2C0F0F),
        primaryColor: const Color(0xFF006400),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      ),
      home: const MainScreen(),
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
        alignment: Alignment.bottomCenter,
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
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(icon: Icon(Icons.waves), label: 'KiwiFlow'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
            BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Плеер'),
          ],
        ),
      ),
    );
  }
}