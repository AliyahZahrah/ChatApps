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
        children: <Widget>[
          const FAQItem(
            question: "Bagaimana cara mengirim pesan?",
            answer:
                "Untuk mengirim pesan, buka percakapan dengan kontak atau grup yang ingin Anda ajak bicara. Ketik pesan Anda dalam kotak teks di bagian bawah layar dan tekan tombol kirim.",
          ),
          const FAQItem(
            question: "Cara mengganti foto profil?",
            answer:
                "Anda dapat mengganti foto profil Anda dengan masuk ke halaman profil Anda. Klik atau ketuk foto profil Anda, lalu pilih opsi untuk mengganti foto profil.",
          ),
          const FAQItem(
            question: "Bagaimana cara membuat grup baru?",
            answer:
                "Untuk membuat grup baru, buka daftar kontak Anda, lalu ketuk opsi untuk membuat grup. Pilih kontak yang ingin Anda tambahkan ke grup, beri nama grup, dan selesaikan pembuatan grup.",
          ),
          // Tambahkan FAQItem lainnya sesuai dengan kebutuhan

          // Bagian Contact Us
          const SizedBox(height: 20.0),
          const Text(
            "Contact Us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          const TextField(
            decoration: InputDecoration(
              hintText: "What can we do to help?",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implementasi logika untuk menangani tombol Submit di sini
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(
                    255, 103, 58, 183), // Warna teks tombol
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Padding tombol
              ),
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          title: Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0, // Ukuran teks pertanyaan
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 16.0, // Ukuran teks jawaban
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
