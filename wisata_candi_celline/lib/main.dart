import 'package:flutter/material.dart';
import 'package:wisata_candi_celline/screens/detail_screen.dart';
import 'package:wisata_candi_celline/data/candi_data.dart';
import 'package:wisata_candi_celline/screens/home_screen.dart';
import 'package:wisata_candi_celline/screens/profile_screen.dart';
import 'package:wisata_candi_celline/screens/search_screen.dart';
import 'package:wisata_candi_celline/screens/sign_in_screen.dart';
import 'package:wisata_candi_celline/screens/favorite_screen.dart';
import 'package:wisata_candi_celline/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'providers/favorite_provider.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(primary: Colors.deepPurple, surface: Colors.deepPurple[50]),
        useMaterial3: true,
      ),
      // Menambahkan home agar aplikasi tahu halaman pertama yang dijalankan adalah MainScreen
      home: const MainScreen(),
      initialRoute: '/',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState(); // Diperbaiki penulisannya sesuai standar
}

class _MainScreenState extends State<MainScreen> {
  // TODO 1. Deklarasikan variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      
      // TODO 3. Buat properti bottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
      // TODO 4. Buat data dan child dari Theme
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Mengubah halaman saat menu bawah ditekan
            });
          },
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.deepPurple),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}