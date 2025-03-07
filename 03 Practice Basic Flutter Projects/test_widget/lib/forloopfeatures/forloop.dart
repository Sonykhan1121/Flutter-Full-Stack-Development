import 'package:flutter/material.dart';
class ForLoopApp extends StatefulWidget { // Changed MyApp to ForLoopApp
  @override
  _ForLoopAppState createState() => _ForLoopAppState(); // Changed _MyAppState to _ForLoopAppState
}

class _ForLoopAppState extends State<ForLoopApp> { // Changed _MyAppState to _ForLoopAppState
  List<Map<String, dynamic>> _todoItems = [];
  TextEditingController _textController = TextEditingController();

  void addItem(String title) {
    setState(() {
      _todoItems.add({'title': title, 'completed': false});
      _textController.clear();
    });
  }

  void toggleItem(int index) {
    setState(() {
      _todoItems[index]['completed'] = !_todoItems[index]['completed'];
    });
  }

  void removeItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('To-Do List'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(labelText: 'Add To-Do'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        addItem(_textController.text);
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todoItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _todoItems[index]['title'],
                      style: TextStyle(
                        decoration: _todoItems[index]['completed']
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: _todoItems[index]['completed'],
                      onChanged: (bool? value) {
                        toggleItem(index);
                      },
                    ),
                    trailing: IconButton(icon: const Icon(Icons.delete), onPressed: (){
                      removeItem(index);
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}