import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Example'),
        backgroundColor: Colors.white, // Hinge-like theme
      ),
      body: Container(
        color: Colors.white, // Background color for the chat
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: const [
            ChatBubble(message: "Hi there!", isMe: false),
            ChatBubble(
              message: "how r u",
              isMe: true,
            ),
            ChatBubble(message: "im chill gng", isMe: true),
          ],
        ),
      ),
    );
  }
}
