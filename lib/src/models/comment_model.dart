class Comment{
  final int postId;
  final int id;
  final String name;
  final String body;
  final String email;

  Comment({this.postId, this.id,this.name, this.body, this.email});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['userId'],
      id: json['id'],
      name: json['name'],
      body: json['body'],
      email: json['email'],
    );
  }

}