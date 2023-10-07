import 'dart:io';
import 'package:chatverse/password.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? imagePath;
  bool isImageSelected = false;

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
    Navigator.of(context).pop(); // Tutup dialog setelah menghapus gambar
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
                        _showProfilePictureOptionsDialog(); // Menampilkan dialog
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
              initialValue: "Cindy", // Nilai awal nama pengguna
              // Buat fungsi untuk menyimpan perubahan nama
              onChanged: (value) {
                // Implementasikan penyimpanan perubahan nama di sini
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Email",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              initialValue:
                  "cindyelonora20@gmail.com", // Nilai awal email pengguna
              // Buat fungsi untuk menyimpan perubahan email
              onChanged: (value) {
                // Implementasikan penyimpanan perubahan email di sini
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              "About",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              maxLines:
                  3, // Ini memungkinkan pengguna untuk menulis beberapa baris teks
              // Implementasikan input status di sini
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Password",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // Ubah warna teks menjadi hitam
            ),
            InkWell(
              onTap: () {
                // Navigasi ke halaman password.dart ketika teks "Change password?" diklik
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PasswordPage()));
              },
              child: const Text(
                "Change password?",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .blue, // Ubah warna teks agar terlihat seperti tautan
                  decoration: TextDecoration.underline, // Tambahkan garis bawah
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementasikan logika untuk menyimpan perubahan profil di sini
                },
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
                Navigator.of(context).pop(); // Tutup dialog
                _pickImage(); // Pilih gambar dari library
              },
              child: const Text("Choose from Library"),
            ),
            if (isImageSelected)
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog
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
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
