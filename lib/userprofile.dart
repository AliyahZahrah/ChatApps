import 'dart:io';
import 'package:chatverse/password.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UserProfile extends StatefulWidget {
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
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
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
                          ? FileImage(File(imagePath!)) as ImageProvider<Object>
                          : AssetImage('assets/img/blankprofile.jpg')
                              as ImageProvider<Object>,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Enter your name and add an optional profile picture",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
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
            SizedBox(height: 16.0),
            Text(
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
            SizedBox(height: 16.0),
            Text(
              "About",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              maxLines:
                  3, // Ini memungkinkan pengguna untuk menulis beberapa baris teks
              // Implementasikan input status di sini
            ),
            SizedBox(height: 16.0),
            Text(
              "Password",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // Ubah warna teks menjadi hitam
            ),
            InkWell(
              onTap: () {
                // Navigasi ke halaman password.dart ketika teks "Change password?" diklik
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PasswordPage()));
              },
              child: Text(
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
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementasikan logika untuk menyimpan perubahan profil di sini
                },
                child: Text("Save"),
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
          title: Text("Profile Picture Options"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _pickImage(); // Pilih gambar dari library
              },
              child: Text("Choose from Library"),
            ),
            if (isImageSelected)
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog
                  _showDeleteProfilePictureConfirmationDialog();
                },
                child: Text("Delete Current Profile Picture"),
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
          title: Text("Delete Current Profile Picture"),
          content: Text(
              "Are you sure you want to delete your current profile picture?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _deleteImageAndSetDefault();
                // Tidak perlu menutup dialog konfirmasi di sini
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
