import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[
          FAQItem(
            question: "Bagaimana cara mengirim pesan?",
            answer:
                "Untuk mengirim pesan, buka percakapan dengan kontak atau grup yang ingin Anda ajak bicara. Ketik pesan Anda dalam kotak teks di bagian bawah layar dan tekan tombol kirim.",
          ),
          FAQItem(
            question: "Cara mengganti foto profil?",
            answer:
                "Anda dapat mengganti foto profil Anda dengan masuk ke halaman profil Anda. Klik atau ketuk foto profil Anda, lalu pilih opsi untuk mengganti foto profil.",
          ),
          FAQItem(
            question: "Bagaimana cara membuat grup baru?",
            answer:
                "Untuk membuat grup baru, buka daftar kontak Anda, lalu ketuk opsi untuk membuat grup. Pilih kontak yang ingin Anda tambahkan ke grup, beri nama grup, dan selesaikan pembuatan grup.",
          ),
          // Tambahkan FAQItem lainnya sesuai dengan kebutuhan
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
