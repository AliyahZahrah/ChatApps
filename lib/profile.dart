import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120.0,
              height: 120.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/img/profile_picture.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Cindy Elonora",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "cindyelonora20",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Fungsi untuk mengedit profil pengguna
                // Ganti dengan navigasi atau fungsi yang sesuai
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 103, 58, 183),
              ),
              child: const Text("Edit Profile"),
            ),
            const SizedBox(height: 32.0),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                // Navigasi ke halaman pengaturan
                // Ganti dengan navigasi yang sesuai
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Information"),
              onTap: () {
                // Navigasi ke halaman informasi
                // Ganti dengan navigasi yang sesuai
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Fungsi untuk logout pengguna
                // Ganti dengan fungsi yang sesuai
              },
            ),
          ],
        ),
      ),
    );
  }
}
