class Post {
  String userId;
  String title,body;


  Post({required this.userId, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
    );
  }
}
