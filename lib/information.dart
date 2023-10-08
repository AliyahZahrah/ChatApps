import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/polos.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'ChatVerse',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Luckiest Guy',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Image.asset(
                    'assets/img/ChatVerse.png',
                    width: 350.0,
                    height: 350.0,
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'ChatVerse adalah aplikasi obrolan yang dirancang untuk memungkinkan pengguna untuk berkomunikasi secara pribadi maupun dalam grup melalui pesan teks, suara, file, video, dan gambar. Aplikasi ini bertujuan untuk memberikan pengalaman obrolan yang mudah, cepat, aman, dan nyaman kepada penggunanya.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
