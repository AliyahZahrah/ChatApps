import 'package:flutter/material.dart';
import 'package:chatverse/group_screen.dart';
import 'package:chatverse/profile.dart';
import 'package:chatverse/contact.dart';
import 'package:chatverse/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("ChatVerse"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: AssetImage('assets/icon/chat.jpg'),
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: AssetImage('assets/icon/groups.jpg'),
          ),
          label: 'Groups',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: AssetImage('assets/icon/user.jpg'),
          ),
          label: 'Profile',
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          // Navigasi ke halaman chat jika ikon chat diklik
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const HomeScreen(key: null)),
          );
        } else if (index == 1) {
          // Navigasi ke halaman group jika ikon grup diklik
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const GroupScreen(key: null)),
          );
        } else if (index == 2) {
          // Navigasi ke halaman profile jika ikon user account diklik
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const ProfileScreen(key: null)),
          );
        }
      },
    );
  }
}

class Body extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsData.length + 1, // Tambahkan satu item untuk ikon tambah
      itemBuilder: (context, index) {
        if (index == 0) {
          // Item pertama adalah ikon tambah
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF673AB7),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'New Contact',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 103, 58, 183),
                ),
              ),
              onTap: () {
                // Aksi ketika ikon tambah diklik
                // Tambahkan logika untuk menambahkan kontak baru di sini
              },
            ),
          );
        } else {
          // Item berikutnya adalah daftar kontak
          final contactIndex =
              index - 1; // Karena elemen pertama adalah "New Contact"
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(chatsData[contactIndex].image),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chatsData[contactIndex].name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        chatsData[contactIndex].time,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    chatsData[contactIndex].lastchat,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              onTap: () {
                // Aksi ketika kontak pesan diklik
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      contactName: chatsData[contactIndex].name,
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
