import 'package:flutter/material.dart';
import 'package:chatverse/settings.dart';
import 'package:chatverse/userprofile.dart';
import 'package:chatverse/information.dart';
import 'package:chatverse/help.dart';

class Sidebar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Sidebar({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          0.6, // Lebar sidebar sesuai kebutuhan
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 103, 58, 183),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/img/blankprofile.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Cindy",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "cindyelonora20@gmail.com",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Edit Profile"),
              onTap: () {
                // Navigasi ke halaman UserProfile saat "Edit Profile" diklik
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserProfile(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const SettingScreen(), // Navigasi ke halaman Settings
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Information"),
              onTap: () {
                // Navigasi ke halaman informasi tentang aplikasi
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InformationScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Help"),
              onTap: () {
                // Navigasi ke halaman bantuan
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HelpScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
