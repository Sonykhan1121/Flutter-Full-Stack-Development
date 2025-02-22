import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/TextExpandFeatures/provider/text_expanded_provider.dart';
import 'package:test_widget/api_features/pages/posts_page.dart';
import 'package:test_widget/api_features/providers/posts_provider.dart';
import 'package:test_widget/constants/constant.dart';

import 'audiofeatures/audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> TextExpandedProvider()),
        ChangeNotifierProvider(create: (_)=> PostsProvider() ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant.title,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: PostsPage(),
      ),

    );
  }
}
