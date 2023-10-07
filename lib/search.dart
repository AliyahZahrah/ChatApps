import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class User {
  final String username;
  final String name;

  User(this.username, this.name);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _search = TextEditingController();
  List<User> userList = [];
  List<User> searchResults = [];

  void onSearch() {
    final searchTerm = _search.text.toLowerCase();
    setState(() {
      searchResults = userList.where((user) {
        return user.username.toLowerCase().contains(searchTerm) ||
            user.name.toLowerCase().contains(searchTerm);
      }).toList();
    });
  }

  @override
  void initState() {
    // Dummy data, replace this with your actual user data
    userList = [
      User("John22", "John Doe"),
      User("Alice13", "Alice Smith"),
      User("John5", "Bob Johnson"),
      // Add more users here
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            height: size.height / 14,
            width: size.width,
            alignment: Alignment.center,
            child: SizedBox(
              height: size.height / 14,
              width: size.width / 1.15,
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 50,
          ),
          ElevatedButton(
            onPressed: onSearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 103, 58, 183),
            ),
            child: const Text("Search", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  // Handle when a user is tapped
                },
                leading: const Icon(Icons.account_box, color: Colors.black),
                title: Text(
                  searchResults[index].name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(searchResults[index].username),
                trailing: const Icon(Icons.chat, color: Colors.black),
              );
            },
          ),
        ],
      ),
    );
  }
}
