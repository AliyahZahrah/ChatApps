import 'package:flutter/material.dart';
import 'package:chatverse/userprofile.dart';
import 'package:chatverse/information.dart';
import 'package:chatverse/help.dart';

class SettingScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SettingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/icon/account.jpg',
                  width: 32.0, height: 32.0),
              title: const Text(
                "Account",
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: const Text("User profile account settings"),
              onTap: () {
                // Navigasi ke halaman UserProfile jika "Account" diklik
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ));
              },
            ),
            ListTile(
              leading: Image.asset('assets/icon/lock.jpg',
                  width: 32.0, height: 32.0),
              title: const Text(
                "Privacy",
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: const Text("Blocked account, temporary message"),
            ),
            ListTile(
              leading: Image.asset('assets/icon/notif.jpg',
                  width: 32.0, height: 32.0),
              title: const Text(
                "Notification",
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: const Text("Chat and group notifications"),
            ),
            ListTile(
              leading: Image.asset('assets/icon/bahasa.jpg',
                  width: 32.0, height: 32.0),
              title: const Text(
                "Application Language",
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: const Text("Language used: English (United States)"),
            ),
            ListTile(
              leading: Image.asset('assets/icon/info.jpg',
                  width: 32.0, height: 32.0),
              title: const Text(
                "Information",
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: const Text("About Application"),
              onTap: () {
                // Navigasi ke halaman InformationScreen jika "Information" diklik
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InformationScreen(),
                ));
              },
            ),
            ListTile(
              leading: Image.asset('assets/icon/help.jpg',
                  width: 32.0, height: 32.0),
              title: const Text(
                "Help",
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: const Text("Help center, contact us"),
              onTap: () {
                // Navigasi ke halaman HelpScreen jika "Help" diklik
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HelpScreen(),
                ));
              },
            ),
            const SizedBox(height: 24.0),
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
