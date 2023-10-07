import 'package:flutter/material.dart';
import 'package:chatverse/userprofile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        // Gunakan SafeArea untuk memastikan konten terlihat dengan baik di bawah status bar
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Account"),
              subtitle: const Text("User profile account settings"),
              onTap: () {
                // Navigasi ke halaman UserProfile jika "Account" diklik
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ));
              },
            ),
            const ListTile(
              title: Text("Privacy"),
              subtitle: Text("Blocked account, temporary message"),
            ),
            const ListTile(
              title: Text("Notification"),
              subtitle: Text("Chat and group notifications"),
            ),
            const ListTile(
              title: Text("Application Language"),
              subtitle: Text("Language used: English (United States)"),
            ),
            const ListTile(
              title: Text("Information"),
              subtitle: Text("About Application"),
            ),
            const ListTile(
              title: Text("Help"),
              subtitle: Text("Help center, contact us"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SettingScreen(),
  ));
}
