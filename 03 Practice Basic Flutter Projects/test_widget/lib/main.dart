import 'package:flutter/material.dart';
import 'package:test_widget/TextExpandFeatures/provider/text_expanded_provider.dart';
import 'package:test_widget/TextExpandFeatures/textexpand.dart';
import 'package:test_widget/constants/constant.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test Widgets",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Textexpand(txt: Constant.gerbage,),
    );
  }
}
