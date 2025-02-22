import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_widget/api_features/model/post_model.dart';

class PostsApiService {


  Future<List<PostModel>> fetchPosts() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(uri);

    if(response.statusCode == 200)
      {
        var jsonResponse = json.decode(response.body) as List;
        print(jsonResponse);
      List<PostModel> posts = jsonResponse.map((value)=> PostModel.fromJson(value)).toList();

       return posts;
      }
    else
      {
        throw Exception('Failed to fetch posts');
      }

  }
}