import 'package:flutter/material.dart';
import 'package:learning_provider/pages/count_provider.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red,
          iconTheme: IconThemeData(color: Colors.white),
        )
      ),
      home: CountProvider(),
    );
  }
}
