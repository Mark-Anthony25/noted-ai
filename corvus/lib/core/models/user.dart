class AppUser {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final DateTime joinedAt;
  final int noteCount;
  final int memoryCount;
  final int streak;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.joinedAt,
    this.noteCount = 0,
    this.memoryCount = 0,
    this.streak = 0,
  });
}
