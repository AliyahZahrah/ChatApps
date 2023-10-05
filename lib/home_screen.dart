import 'package:flutter/material.dart';
import 'package:chatverse/group_screen.dart';
import 'package:chatverse/profile.dart';
import 'contact.dart'; // Import file contact.dart

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
      itemCount: chatsData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 16), // Tambahkan padding
          child: ListTile(
            leading: CircleAvatar(
              radius: 30, // Peningkatan ukuran CircleAvatar
              backgroundImage: AssetImage(chatsData[index].image),
            ),
            title: Text(
              chatsData[index].name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chatsData[index].lastchat,
                  style: const TextStyle(
                      fontSize: 16), // Peningkatan ukuran teks lastchat
                ),
                Opacity(
                  opacity: 0.6, // Tambahkan opacity pada teks waktu (time)
                  child: Text(
                    chatsData[index].time,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16), // Peningkatan ukuran teks time
                  ),
                ),
              ],
            ),
            onTap: () {
              // Aksi ketika kontak pesan diklik
            },
          ),
        );
      },
    );
  }
}
