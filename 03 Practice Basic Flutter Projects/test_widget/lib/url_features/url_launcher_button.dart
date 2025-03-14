import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class urlLauncherButton extends StatelessWidget {
  final String url;
  final String btn_name;

  urlLauncherButton({required this.url, required this.btn_name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _launchURL, child: Text(btn_name));
  }

  void _launchURL() async {
    if (await canLaunch(url)) {
      Uri uri = Uri.parse(url);
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
