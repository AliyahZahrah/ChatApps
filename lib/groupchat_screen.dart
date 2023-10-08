import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart' as file_picker;
import 'package:audioplayers/audioplayers.dart';

class GroupChatScreen extends StatefulWidget {
  final String groupName;

  const GroupChatScreen({Key? key, required this.groupName}) : super(key: key);

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<GroupChatMessage> _messages = [];
  final ImagePicker _imagePicker = ImagePicker();
  late AudioPlayer _audioPlayer;
  String? _audioFilePath;

  @override
  void initState() {
    super.initState();
    _messages.addAll([
      const GroupChatMessage(
        senderName: "aliyahz22",
        text: "Hi, Selamat Bergabung di Group Kami!",
      ),
      const GroupChatMessage(
        senderName: "sasa",
        text: "Hi, Semuanya",
      ),
      const GroupChatMessage(
        senderName: "tiara",
        text: "Senang bergabung dengan kalian",
      ),
      const GroupChatMessage(
        senderName: "hansel",
        text:
            "Bagaimana kabar kalian semua? Semoga kabar kalian baik-baik saja",
      ),
    ]);
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    String senderName = widget.groupName;
    GroupChatMessage message = GroupChatMessage(
      senderName: senderName,
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
    file_picker.FilePickerResult? result =
        await file_picker.FilePicker.platform.pickFiles(
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
      await _audioPlayer.play(_audioFilePath as Source);
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
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/img/groupmp.jpg'),
              radius: 16,
            ),
            const SizedBox(width: 8), // Jarak antara avatar dan teks
            Text(widget.groupName),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
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
      ),
    );
  }
}

class GroupChatMessage extends StatelessWidget {
  final String senderName;
  final String text;

  const GroupChatMessage(
      {Key? key, required this.senderName, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCurrentUser = senderName == "cindyelonora20";
    final textColor = isCurrentUser ? Colors.black : Colors.white;
    final alignment =
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final margin = isCurrentUser
        ? const EdgeInsets.only(left: 80.0, right: 8.0, top: 8.0, bottom: 8.0)
        : const EdgeInsets.only(left: 8.0, right: 80.0, top: 8.0, bottom: 8.0);
    final borderRadius = isCurrentUser
        ? const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          );

    final messageBackground =
        isCurrentUser ? Colors.white : const Color.fromARGB(255, 103, 58, 183);

    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: alignment,
        children: <Widget>[
          if (!isCurrentUser)
            Text(
              senderName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: messageBackground,
              borderRadius: borderRadius,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
