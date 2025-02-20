import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/TextExpandFeatures/provider/text_expanded_provider.dart';
import 'package:test_widget/TextExpandFeatures/textexpand.dart';
import 'package:test_widget/appbar_features/appbar_testing.dart';
import 'package:test_widget/button_features/buttons.dart';
import 'package:test_widget/constants/constant.dart';
import 'package:test_widget/container_features/container_test.dart';
import 'package:test_widget/file_features/file_info_example.dart';
import 'package:test_widget/file_features/imageconversionexample.dart';
import 'package:test_widget/image_features/image_test.dart';
import 'package:test_widget/image_features/loadingimage.dart';
import 'package:test_widget/listview_features/list_view_test.dart';

import 'card_features/card_test.dart';

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
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constant.title,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: AppbarTesting(),
      ),

    );
  }
}
