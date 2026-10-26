import 'package:flutter/material.dart';
import 'package:wisata_candi_celline/screens/detail_screen.dart';
import 'package:wisata_candi_celline/data/candi_data.dart';
import 'package:wisata_candi_celline/screens/profile_screen.dart';
import 'package:wisata_candi_celline/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: DetailScreen(candi: candiList[0]),
      // home: ProfileScreen(),
      home: SignInScreen(),
    );
  }
}


