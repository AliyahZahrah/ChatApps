import 'package:flutter/material.dart';
import 'package:chatverse/splash_screen.dart';
import 'package:chatverse/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatVerse',
      theme: ThemeData(
        primarySwatch: Colors
            .deepPurple, // Menggunakan primarySwatch dengan warna deepPurple
        scaffoldBackgroundColor: const Color.fromARGB(255, 252, 251, 252),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Tampilkan splash screen pertama
      routes: {
        '/welcome': (context) =>
            const WelcomeScreen(), // Tambahkan rute untuk welcome screen
      },
    );
  }
}
