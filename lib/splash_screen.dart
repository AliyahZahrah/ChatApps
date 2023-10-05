import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoSizeAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi controller dan animasi
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Durasi animasi 5 detik
    );

    _logoSizeAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve:
            const Interval(0.0, 0.5), // Animasi skala selama 2.5 detik pertama
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
            0.5, 1.0), // Animasi opacity selama 2.5 detik terakhir
      ),
    );

    // Jalankan animasi logo
    _animationController.forward();

    // Navigasi ke WelcomeScreen setelah selesai animasi
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacementNamed('/welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.scale(
                scale: _logoSizeAnimation.value,
                child: Image.asset(
                  'assets/img/ChatVerse.png',
                  width: 150.0,
                  height: 150.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
