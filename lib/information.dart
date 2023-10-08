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
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/img/ChatVerse.png',
                    width: 350.0,
                    height: 350.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'ChatVerse adalah aplikasi obrolan yang dirancang untuk memungkinkan pengguna untuk berkomunikasi secara pribadi maupun dalam grup melalui pesan teks, suara, file, video, dan gambar. Aplikasi ini bertujuan untuk memberikan pengalaman obrolan yang mudah, cepat, aman, dan nyaman kepada penggunanya.',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
