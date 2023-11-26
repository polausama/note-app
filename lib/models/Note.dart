class Note {
  int? id;
  String? title;
  String? content;
  String? password;
  String?datetime;

  Note({this.id, this.title, this.content, this.password,this.datetime});
  Note.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    content = map['content'];
    password = map['password'];
    datetime = map['datetime'];

  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'password': password,
      'datetime':DateTime.now().toString()
    };
  }
}
