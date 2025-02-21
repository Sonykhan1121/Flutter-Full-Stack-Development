import 'package:flutter/material.dart';

class TextfieldTest extends StatefulWidget {
  const TextfieldTest({super.key});

  @override
  State<TextfieldTest> createState() => _TextfieldTestState();
}

class _TextfieldTestState extends State<TextfieldTest> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Textfeield Test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Enter your text',
            hintText: 'Type something...',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.text_fields),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _controller.clear(); // Clear the text field
              },
            ),
          ),
          keyboardType: TextInputType.text,
          obscureText: false, // Set to true for password fields
          maxLines: 2, // Set to null for unlimited lines
          onChanged: (value) {
            // Handle text changes
            print('Text changed: $value');
          },
        ),

      ),
    );
  }
}
