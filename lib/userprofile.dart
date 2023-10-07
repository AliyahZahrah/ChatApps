import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:chatverse/password.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? imagePath;
  bool isImageSelected = false;
  bool isPasswordVisible = false;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        imagePath = result.files.single.path;
        isImageSelected = true;
      });
    }
  }

  void _deleteImageAndSetDefault() {
    setState(() {
      imagePath = 'assets/img/blankprofile.jpg';
      isImageSelected = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      if (!isImageSelected) {
                        _pickImage();
                      } else {
                        _showProfilePictureOptionsDialog();
                      }
                    },
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage: isImageSelected
                          ? FileImage(File(imagePath!))
                          : const AssetImage('assets/img/blankprofile.jpg')
                              as ImageProvider,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Enter your name and add an optional profile picture",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Display Name",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: "Cindy",
              onChanged: (value) {},
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Username",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue: "cindyelonora20",
              onChanged: (value) {},
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "About",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  initialValue:
                      "Hai! Saya menggunakan ChatVerse.", // Nilai awal
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16.0),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Password",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            TextFormField(
              obscureText: !isPasswordVisible,
              initialValue: "cindypage2511",
              onChanged: (value) {},
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PasswordPage()));
              },
              child: const Text(
                "Change password?",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showProfilePictureOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Profile Picture Options"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage();
              },
              child: const Text("Choose from Library"),
            ),
            if (isImageSelected)
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showDeleteProfilePictureConfirmationDialog();
                },
                child: const Text("Delete Current Profile Picture"),
              ),
          ],
        );
      },
    );
  }

  void _showDeleteProfilePictureConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Current Profile Picture"),
          content: const Text(
              "Are you sure you want to delete your current profile picture?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _deleteImageAndSetDefault();
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
