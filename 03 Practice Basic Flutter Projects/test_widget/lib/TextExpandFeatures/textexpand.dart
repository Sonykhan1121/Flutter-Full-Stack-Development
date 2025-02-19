import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_widget/TextExpandFeatures/provider/text_expanded_provider.dart';

class Textexpand extends StatefulWidget {
  final String txt;

  const Textexpand({super.key, required this.txt});

  @override
  State<Textexpand> createState() => _TextexpandState();
}

class _TextexpandState extends State<Textexpand> {

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Expanded Text"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<TextExpandedProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return GestureDetector(
                  onTap: (){
                    value.toggleExpanded();
                  },
                  child: Text(
                    widget.txt,
                    maxLines: value.isExpanded?null: 3,
                    overflow: value.isExpanded?TextOverflow.visible:TextOverflow.ellipsis,

                  ),
                );
              },

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
