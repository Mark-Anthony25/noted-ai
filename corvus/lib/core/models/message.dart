enum MessageSender { user, ai }

class Message {
  final String id;
  final String content;
  final MessageSender sender;
  final DateTime timestamp;
  final bool isStreaming;

  const Message({
    required this.id,
    required this.content,
    required this.sender,
    required this.timestamp,
    this.isStreaming = false,
  });
}
