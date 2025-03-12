import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class ToastTest extends StatelessWidget {
  const ToastTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Toast Package')),
      body: Column(
        children: [
          ListTile(

            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.mic),
            ),
            title: Text('Mic Permission'),
            subtitle: Text('Click to get access to Mic'),

            onTap: requestMicPermission,
          ),
        ],
      ),
    );
  }

  void requestMicPermission() async {
    var status = await Permission.microphone.status;
    if (status.isGranted) {
      Fluttertoast.showToast(msg: 'Your permission granted sucessfully');
    } else if (status.isDenied) {
      if (await Permission.microphone.request().isGranted) {
        Fluttertoast.showToast(msg: 'Tnq for permission');
      } else
        Fluttertoast.showToast(msg: 'Permission denied');
    }
  }
  void show_toast(String msg )
  {
    Fluttertoast.showToast(
        msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 32.0,
      fontAsset: 'assets/fonts/poppins/Poppins-Bold.ttf',
      webBgColor: 	Colors.red,
      webPosition: "right",
      webShowClose: true,

    );
    // Fluttertoast.cancel();
  }
}
