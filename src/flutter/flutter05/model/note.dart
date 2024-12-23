class Note {
  int? id;
  String title;
  String content;
  DateTime  createdAt;

  Note({this.id,
    required this.title,
    required this.content,
    DateTime? createdAt}) : this.createdAt = createdAt ?? DateTime.now();

  // chuyển đổi đối tượng note thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt' : createdAt.toIso8601String(),
    };
  }

  // chuyển đổi đối tượng Map thành note
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
