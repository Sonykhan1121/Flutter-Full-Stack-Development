import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_widget/api_features/model/post_model.dart';
import 'package:test_widget/api_features/api_services/posts_api_service.dart';


class PostsProvider with ChangeNotifier{
  List<PostModel>? _listOfPosts;
  final PostsApiService _postsApiService = PostsApiService();

  List<PostModel>? get listOfPosts => _listOfPosts;


  Future<void> loadPosts() async {

      _listOfPosts = await _postsApiService.fetchPosts();
        notifyListeners();
  }

}

