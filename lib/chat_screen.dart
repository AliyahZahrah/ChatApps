import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:audioplayers/audioplayers.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({Key? key, required this.contactName}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ImagePicker _imagePicker = ImagePicker();
  late AudioPlayer _audioPlayer;
  String? _audioFilePath;

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
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
      // ignore: unused_local_variable
      final fileName = result.files.single.name;
      // ignore: unused_local_variable
      final fileSize = result.files.single.size;

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
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: _pickImage,
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: _pickFile,
          ),
          IconButton(
            icon: Icon(_audioFilePath != null ? Icons.stop : Icons.mic),
            onPressed: _recordAudio,
          ),
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contactName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  const ChatMessage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              child: Text('User'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'User',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
