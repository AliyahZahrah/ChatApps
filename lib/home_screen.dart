import 'package:chatverse/chat_screen.dart';
import 'package:chatverse/search.dart';
import 'package:flutter/material.dart';
import 'package:chatverse/group_screen.dart';
import 'contact.dart';
import 'package:chatverse/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSidebarOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: Stack(
        children: [
          const Body(),
          if (isSidebarOpen)
            GestureDetector(
              onTap: () {
                // Tutup sidebar saat area luar (content) diklik
                _toggleSidebar();
              },
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          if (isSidebarOpen)
            const Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Sidebar(),
            ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  AppBar buildCustomAppBar() {
    return AppBar(
      title: const Text("ChatVerse"),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            );
          },
        ),
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else if (index == 1) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const GroupScreen(
                groupName: '',
              ),
            ),
          );
        } else if (index == 2) {
          // Memanggil metode _toggleSidebar saat profil diklik
          _toggleSidebar();
        }
      },
    );
  }

  void _toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
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
                'New Chat',
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
