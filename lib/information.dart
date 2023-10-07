import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(
                  'assets/img/ChatVerse.png'), // Ganti dengan path ke gambar logo
              width: 120.0, // Sesuaikan dengan ukuran logo
              height: 120.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'ChatVerse adalah aplikasi obrolan yang dirancang untuk memungkinkan pengguna untuk berkomunikasi secara instan melalui pesan teks, suara, file, video, dan gambar. Aplikasi ini bertujuan untuk memberikan pengalaman obrolan yang cepat, aman, dan nyaman kepada penggunanya.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
