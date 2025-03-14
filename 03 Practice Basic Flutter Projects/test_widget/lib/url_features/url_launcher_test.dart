import 'package:flutter/material.dart';
import 'package:test_widget/url_features/url_launcher_button.dart';

import 'emaillauncherbutton.dart';

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
              SizedBox(height: 20,),

              emailLauncherButton(email:"sony@gmail.com",body:"this is a body"),
                SizedBox(height: 20,),
              urlLauncherButton(
                url: "sms:5550101234",
                btn_name: 'Send SMS',
              ),
              urlLauncherButton(
                url: "tel:+1-555-010-999",
                btn_name: 'call',
              ),
              const SizedBox(height: 20),

              /// **Open Local File**
              // fileLauncherButton(
              //   url: "file:///storage/emulated/0/Download/sample.pdf",
              //   btnName: 'Open File',
              // ),

            ],
          ),
        ));
  }
}


