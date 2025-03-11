import 'package:flutter/material.dart';
import 'package:test_widget/homepage.dart';

import 'onGenerateroute/pages/error_test.dart';

Route<dynamic> route(RouteSettings settings) {
  final args = settings.arguments;
  if (settings.name == '/') {
    return MaterialPageRoute(builder: (context) => Homepage());
  } else if (settings.name == '/signuptest') {}
  return MaterialPageRoute(
    builder: (context) => ErrorTest(message: "wrong route"),
  );
}
