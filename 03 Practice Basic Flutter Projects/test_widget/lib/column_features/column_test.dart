import 'package:flutter/material.dart';

class ColumnTest extends StatefulWidget {
  const ColumnTest({super.key});

  @override
  State<ColumnTest> createState() => _ColumnTestState();
}

class _ColumnTestState extends State<ColumnTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          spacing: 16,  // Space between each child
          children: [
            Text('Item 1'),
            Text('Item 2'),
            Text('Item 3'),
          ],
        ),
      )

    );
  }
}
