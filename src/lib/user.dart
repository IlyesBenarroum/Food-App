class User {
  final int id;
  final String title;
  final String content;
  final bool active;
  
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        title = json['title'] ?? '',
        content = json['content'] ?? '',
        active = json['active'] ?? true;
}
