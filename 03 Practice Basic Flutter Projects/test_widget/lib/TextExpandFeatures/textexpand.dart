import 'package:flutter/material.dart';

class Textexpand extends StatefulWidget {
  final String txt;

  const Textexpand({super.key, required this.txt});

  @override
  State<Textexpand> createState() => _TextexpandState();
}

class _TextexpandState extends State<Textexpand> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Expanded Text"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  _isExpanded =!_isExpanded;
                });
              },
              child: Text(
                widget.txt,
                maxLines: _isExpanded?null: 3,
                overflow: _isExpanded?TextOverflow.visible:TextOverflow.ellipsis,

              ),
            ),
            SizedBox(height: 30),
            Container(color: Colors.grey, height: 200),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 100, height: 500, color: Colors.purple),
                Container(width: 100, height: 500, color: Colors.purple),
                Container(width: 100, height: 500, color: Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
