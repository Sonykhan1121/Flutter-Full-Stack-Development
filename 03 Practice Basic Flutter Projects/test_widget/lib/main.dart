import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/TextExpandFeatures/provider/text_expanded_provider.dart';
import 'package:test_widget/api_features/pages/comments_page.dart';
import 'package:test_widget/api_features/pages/posts_page.dart';
import 'package:test_widget/api_features/pages/sendimage.dart';
import 'package:test_widget/api_features/pages/signup.dart';
import 'package:test_widget/api_features/providers/comments_provider.dart';
import 'package:test_widget/api_features/providers/posts_provider.dart';
import 'package:test_widget/back_home_history_nav_button_features/custom_back_button_screen.dart';
import 'package:test_widget/bluetooth_features/testpage.dart';
import 'package:test_widget/constants/constant.dart';
import 'package:test_widget/routes_features/gorouter/routes/app_router_version1.dart';

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
        ChangeNotifierProvider(create: (_)=>CommentsProvider()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant.title,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: "/",
        onGenerateRoute: AppRouterVersion1.route,
      ),

    );
  }
}
