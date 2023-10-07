import 'package:chatverse/chat_screen.dart';
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
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Buka atau tutup sidebar saat ikon menu diklik
            _toggleSidebar();
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
              builder: (context) => const GroupScreen(),
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
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
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
                  style: const TextStyle(fontSize: 16),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    chatsData[index].time,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    contactName: chatsData[index].name,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
