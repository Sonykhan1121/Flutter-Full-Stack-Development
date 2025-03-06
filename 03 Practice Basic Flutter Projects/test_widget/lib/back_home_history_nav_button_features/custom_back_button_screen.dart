import 'package:flutter/material.dart';

class CustomBackButtonScreen extends StatefulWidget {
  const CustomBackButtonScreen({super.key});

  @override
  State<CustomBackButtonScreen> createState() => _CustomBackButtonScreenState();
}

class _CustomBackButtonScreenState extends State<CustomBackButtonScreen> {
  bool _shouldPop = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _shouldPop,
      onPopInvokedWithResult: (didPop, result) async {
        if(!didPop)
          {
            bool exit = await _onBackPressed();
            setState(() {
              _shouldPop = exit;
            });

          }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Custom Back Button'),

        ),
        body: Center(
          child: Text('press back button to see Custom behaviour'),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text("ExitApp!"),
      content: Text("Do you really want to exit the App!"),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            _shouldPop = true;
            Navigator.of(context).pop(true);
          },
          child: Text('Yes'),
        ),
      ],
    ));
  }
}
