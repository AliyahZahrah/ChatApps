import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Your Password"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Your current password",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _currentPasswordController,
              obscureText: true,
              // Implementasikan logika untuk menyimpan kata sandi saat ini di sini
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Your new password",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              // Implementasikan logika untuk menyimpan kata sandi baru di sini
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Re-enter your new password",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              // Implementasikan logika untuk menyimpan konfirmasi kata sandi baru di sini
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementasikan logika untuk menyimpan password yang baru di sini
                },
                child: const Text("Save"),
              ),
            ),
            const SizedBox(height: 8.0), // Spasi tambahan
            Center(
              child: InkWell(
                onTap: () {
                  // Implementasikan logika untuk tindakan reset password di sini
                },
                child: const Text(
                  "Reset Password?",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue, // Warna teks menjadi biru
                    decoration:
                        TextDecoration.underline, // Tambahkan garis bawah
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
