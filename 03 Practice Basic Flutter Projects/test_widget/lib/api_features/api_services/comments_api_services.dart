import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_widget/api_features/model/comment_model.dart';

class CommentsApiService {

  Future<List<CommentModel>> fetchComments() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final response = await http.get(uri);
    if(response.statusCode==200)
      {
        final jsonResponse = json.decode(response.body) as List;
        return jsonResponse.map((json) => CommentModel.fromJson(json)).toList();


      }
    else
      {
        throw Exception('Failed to fetch comments');
      }
  }
}