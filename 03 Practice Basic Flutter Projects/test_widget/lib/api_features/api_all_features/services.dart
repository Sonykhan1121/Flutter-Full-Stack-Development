import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_widget/api_features/api_all_features/post.dart';

class Services {
  static Future<Post> createPost(Post post) async {
    Map<String, dynamic> data = {
      'userId': post.userId,
      'title': post.title,
      'body': post.body,
    };
    print("createPost");
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    print("createPost");

    final response = await http.post(uri, body: data);

    print("code: ${response.statusCode}");
    return Post.fromJson(json.decode(response.body));
  }

 static Future<Post> updatePost(Post post) async {
    Map<String, dynamic> data = {
      'userId': post.userId,
      'id': "101",
      'title': post.title,
      'body': post.body,
    };
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.put(uri, body: data);

    print(response.statusCode);
    return Post.fromJson(json.decode(response.body));
  }
 static Future<void> deletePost() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.delete(uri);


    print(response.statusCode);
    print('delete successfully');

  }
  static Future<List<Post>> getPost() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);
    // print(json.decode(response.body));
    final List<dynamic> now = json.decode(response.body);
    List<Post> posts = now.map((value)=> Post.fromJson(value)).toList() ;

    return posts;

  }

}
