import 'package:flutter/material.dart';
import 'package:test_widget/url_features/url_launcher_button.dart';

class UrlLauncherTest extends StatelessWidget {
  const UrlLauncherTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('URL Launcher Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              urlLauncherButton(url: "https://flutter.dev", btn_name: 'flutter',),
            ],
          ),
        ));
  }
}


