import 'package:flutter/material.dart';
import 'package:chatverse/login_screen.dart'; // Pastikan Anda mengimpor file login_screen.dart

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome!',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Montserrat', // Gunakan font yang menarik
                    ),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.waving_hand, // Gunakan ikon melambaikan tangan
                      size: 40.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Selamat Datang di ChatVerse!', // Tambahkan teks ini
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Image.asset(
              'assets/img/welcome.jpg',
              width: 5000.0, // Sesuaikan lebar gambar
            ),
            const Text(
              'Menghubungkanmu dengan siapa saja, kapan saja, dimana saja!',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 125, 26, 248),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
