

import 'package:flutter/material.dart';
import 'package:test_widget/api_features/api_services/comments_api_services.dart';
import 'package:test_widget/api_features/model/comment_model.dart';

class CommentsProvider with ChangeNotifier{
  List<CommentModel>? _listOfComments;
  final CommentsApiService _commentsApiService = CommentsApiService();

  List<CommentModel>? get listOfComments => _listOfComments;

  Future<void> loadComments() async {
    _listOfComments = await _commentsApiService.fetchComments();
    notifyListeners();
  }
}