import 'package:chatverse/contact.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:audioplayers/audioplayers.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({Key? key, required this.contactName}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _initializeMessages();
  }

  void _initializeMessages() {
    // Cari kontak yang sesuai dengan widget.contactName
    Contact? contact = chatsData.firstWhere(
      (element) => element.name == widget.contactName,
      orElse: () => null,
    );

    if (contact != null) {
      // Inisialisasi pesan awal
      _messages = [
        ChatMessage(
          text: "Hi cindy",
          isUser: false,
          senderName: widget.contactName,
        ),
        // Tambahkan pesan lainnya di sini
      ];
    }

    // Urutkan pesan dari yang terlama ke terbaru
    _messages = _messages.reversed.toList();
  }

  final ImagePicker _imagePicker = ImagePicker();
  late AudioPlayer _audioPlayer;
  String? _audioFilePath;

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
      senderName: "Cindy",
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // Handle the selected image (pickedImage.path)
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await file_picker.FilePicker.platform.pickFiles(
      type: file_picker.FileType.custom,
      allowedExtensions: [
        'pdf',
        'doc',
        'xls',
        'csv',
        'txt',
        'jpg',
        'jpeg',
        'png',
        'gif',
        'mp3',
        'mp4'
      ],
    );
    if (result != null) {
      // Handle the selected file (filePath, fileName, fileSize)
    }
  }

  void _recordAudio() async {
    if (_audioFilePath != null) {
      await _audioPlayer.stop();
      setState(() {
        _audioFilePath = null;
      });
    } else {
      _audioPlayer = AudioPlayer();
      await _audioPlayer
          .play(_audioFilePath as Source); // Path ke file audio lokal
      setState(() {
        _audioFilePath = 'path_to_audio_file.mp3';
      });
    }
  }

  Widget _buildTextComposer() {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: _pickImage,
            color: Colors.deepPurple, // Ganti warna ikon menjadi ungu
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: _pickFile,
            color: Colors.deepPurple, // Ganti warna ikon menjadi ungu
          ),
          IconButton(
            icon: Icon(_audioFilePath != null ? Icons.stop : Icons.mic),
            onPressed: _recordAudio,
            color: Colors.deepPurple, // Ganti warna ikon menjadi ungu
          ),
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
              style: TextStyle(
                fontSize: 16.0, // Ubah ukuran font teks
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
            color: Colors.deepPurple, // Ganti warna ikon menjadi ungu
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  // Mengambil gambar profil dari data kontak
                  chatsData
                      .firstWhere(
                        (contact) => contact.name == widget.contactName,
                      )
                      .image,
                ),
                radius: 20.0, // Atur ukuran radius sesuai kebutuhan Anda
              ),
              SizedBox(
                  width:
                      10), // Tambahkan jarak antara gambar profil dan nama kontak
              Text(widget.contactName),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Tambahkan padding kiri dan kanan
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.0); // Jarak antara bubble chat
                },
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              ),
            ),
            const Divider(height: 1.0),
            Container(
              padding: const EdgeInsets.all(
                  8.0), // Tambahkan padding untuk jarak samping
              decoration: BoxDecoration(
                color: Colors
                    .white, // Ganti warna latar belakang chat menjadi putih
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser; // Menentukan apakah pesan dari pengguna atau bukan
  final String senderName; // Nama pengirim pesan

  const ChatMessage({
    Key? key,
    required this.text,
    required this.isUser,
    required this.senderName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.0, // Ubah margin kiri menjadi 16.0
        right: 10.0, // Ubah margin kanan menjadi 16.0
        top: 7.5, // Tambahkan margin atas sekitar 7.5
        bottom: 7.5, // Tambahkan margin bawah sekitar 7.5
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment
                .start, // Pesan pengirim di sebelah kanan, penerima di sebelah kiri
        children: <Widget>[
          isUser
              ? SizedBox(
                  width: 30.0,
                ) // Tambahkan jarak ke kanan untuk bubble chat pengguna
              : SizedBox(width: 0), // Biarkan nol untuk bubble chat penerima
          Expanded(
            child: Column(
              crossAxisAlignment: isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment
                      .start, // Penyesuaian teks untuk pengirim dan penerima
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(10.0),
                  // Padding untuk bubble text
                  decoration: BoxDecoration(
                    color: isUser
                        ? Colors.deepPurple
                        : Colors
                            .white, // Ganti warna bubble text sesuai pengirim/penerima
                    borderRadius:
                        BorderRadius.circular(8.0), // Bentuk bubble text
                    border: Border.all(
                      color: isUser
                          ? Colors.deepPurple
                          : Colors
                              .black, // Warna border sesuai pengirim/penerima
                      width: 1.0, // Lebar border
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isUser
                          ? Colors
                              .white // Ganti warna teks pengguna menjadi putih
                          : Colors
                              .black, // Ganti warna teks penerima menjadi hitam
                      fontSize: 16.0, // Ubah ukuran font teks
                    ),
                  ),
                ),
                SizedBox(height: 0.5), // Tambahkan jarak ke bawah sekitar 12.0
              ],
            ),
          ),
          !isUser
              ? SizedBox(
                  width: 30.0,
                ) // Tambahkan jarak ke kanan untuk bubble chat penerima
              : SizedBox(width: 0), // Biarkan nol untuk bubble chat pengguna
        ],
      ),
    );
  }
}
