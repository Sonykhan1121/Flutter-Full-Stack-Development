import 'package:flutter/material.dart';
import 'package:learning_provider/pages/count.dart';
import 'package:learning_provider/pages/time_periodic.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_) =>CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.yellow,
              iconTheme: IconThemeData(color: Colors.white),
            )
        ),
        home: TimePeriodic(),
      ),
    );

  }
}
