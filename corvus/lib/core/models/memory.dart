class Memory {
  final String id;
  final String title;
  final String snippet;
  final String category;
  final DateTime timestamp;
  final List<String> tags;
  final String? sourceNoteId;

  const Memory({
    required this.id,
    required this.title,
    required this.snippet,
    required this.category,
    required this.timestamp,
    this.tags = const [],
    this.sourceNoteId,
  });
}
