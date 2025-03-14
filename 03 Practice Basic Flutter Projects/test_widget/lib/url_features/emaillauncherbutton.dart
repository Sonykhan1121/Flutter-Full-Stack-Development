import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class emailLauncherButton extends StatelessWidget {
  final String email;
  final String body;

  const emailLauncherButton({
    required this.email,
    required this.body,
    super.key,
  });

  String? encodeQueryParamereters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  void sendEmail() {

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sony@gmail.com',
      query: encodeQueryParamereters(<String, String>{'subject': body}),
    );
    launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: sendEmail, child: Text('send Email'));
  }
}
