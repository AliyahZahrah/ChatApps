import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/icon/user.jpg'),
            radius: 60.0,
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Aksi ketika ikon Settings diklik
            },
            iconSize: 40.0,
          ),
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 20.0),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Aksi ketika ikon Log Out diklik
            },
            iconSize: 40.0,
          ),
          const Text(
            'Log Out',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
