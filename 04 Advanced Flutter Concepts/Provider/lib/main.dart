import 'package:flutter/material.dart';
import 'package:learning_provider/pages/count.dart';
import 'package:learning_provider/pages/slider_example.dart';
import 'package:learning_provider/pages/time_periodic.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:learning_provider/provider/slider_provider.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CountProvider()),
        ChangeNotifierProvider(create: (_)=>SliderProvider()),
      ],

      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:ThemeMode.dark,
      theme:ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.blue,
            iconTheme: IconThemeData(color: Colors.white),
          )
      ),
      home: SliderExample(),
    ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create:(_) =>CountProvider(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         themeMode: ThemeMode.light,
//         theme: ThemeData(
//             appBarTheme: AppBarTheme(
//               color: Colors.yellow,
//               iconTheme: IconThemeData(color: Colors.white),
//             )
//         ),
//         home: TimePeriodic(),
//       ),
//     );
//
//   }
// }
