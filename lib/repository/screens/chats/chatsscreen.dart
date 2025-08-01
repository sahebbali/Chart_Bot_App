import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String contactName;
  final String demoMessage;

  const ChatScreen({
    super.key,
    required this.contactName,
    required this.demoMessage,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {"text": "Hi $contactName!", "isMe": true},
      {"text": demoMessage, "isMe": false},
      {"text": "How's everything going?", "isMe": true},
      {"text": "All good! Just chilling.", "isMe": false},
      {"text": "Nice to hear!", "isMe": true},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(contactName),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // newest messages at bottom
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message =
                    messages[messages.length - 1 - index]; // reverse order
                return Align(
                  alignment: message["isMe"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: message["isMe"]
                          ? Colors.blueAccent
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: message["isMe"]
                            ? Radius.circular(12)
                            : Radius.zero,
                        bottomRight: message["isMe"]
                            ? Radius.zero
                            : Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message["text"],
                      style: TextStyle(
                        color: message["isMe"] ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black12)],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
