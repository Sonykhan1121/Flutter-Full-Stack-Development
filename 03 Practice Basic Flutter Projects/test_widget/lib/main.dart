import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/TextExpandFeatures/provider/text_expanded_provider.dart';
import 'package:test_widget/api_features/providers/comments_provider.dart';
import 'package:test_widget/api_features/providers/posts_provider.dart';
import 'package:test_widget/constants/constant.dart';
import 'package:test_widget/routes_features/onGenerateroute/routes/app_router_version1.dart';

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
        ChangeNotifierProvider(create: (_)=> PostsProvider()),
        ChangeNotifierProvider(create: (_)=>CommentsProvider()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant.title,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: "/image_zooming",
        onGenerateRoute: AppRouterVersion1.route,
      ),

    );
  }
}
